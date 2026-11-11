part of 'main.dart';

// The opener page opens the popup page with target="_blank". Both come from
// the local Node test server.
WebUri _onCreateWindowUrl(String page) =>
    WebUri('http://${environment["NODE_SERVER_IP"]}:8082/$page');
final _openerUrl = _onCreateWindowUrl('on-create-window.html');
final _popupUrl = _onCreateWindowUrl('on-create-window-popup.html');

// The logs go to the test output, where CI keeps them.
// ignore: avoid_print
void _windowLog(String message) => print('[onCreateWindow] $message');

/// Logs [step] with a timestamp, then waits for [future].
///
/// It fails at once if [failed] completes first, and fails with [step] in
/// the message if [timeout] passes. A hang then names its step, well before
/// the test's own 60 s timeout.
Future<T> _windowStep<T>(
  String step,
  Future<T> future,
  Completer<Never> failed, {
  Duration timeout = const Duration(seconds: 20),
}) async {
  final start = DateTime.now();
  _windowLog('${start.toIso8601String()} $step: waiting');
  final T result = await Future.any<T>([future, failed.future]).timeout(
    timeout,
    onTimeout: () =>
        throw TestFailure('$step: no result after ${timeout.inSeconds} s'),
  );
  final ms = DateTime.now().difference(start).inMilliseconds;
  _windowLog('$step: done after $ms ms');
  return result;
}

/// Pumps [widget], then pumps again until [key] is in the tree.
///
/// In each of 6 logged "popup onWebViewCreated" failures (Linux, macOS),
/// pumpWidget returned in 0-2 ms and the popup never asked the platform to
/// create its view, which it does from initState without needing a frame.
/// Passing pumps took 7-69 ms, and creation followed within 33 ms. Off
/// Android and the web, frames are drawn only when the test pumps, so a
/// popup missed by that pump stayed unbuilt while the test waited.
Future<void> _pumpUntilBuilt(
  WidgetTester tester,
  Widget widget,
  GlobalKey key,
) async {
  await tester.pumpWidget(widget);
  for (var pumps = 1; key.currentContext == null; pumps++) {
    if (pumps == 20) {
      throw TestFailure('$key not built after $pumps pumps');
    }
    _windowLog('$key not built by pump $pumps; pumping again');
    await tester.pump(const Duration(milliseconds: 50));
  }
}

/// Callbacks that fail [failed] when [name]'s page process ends.
({
  void Function(InAppWebViewController, RenderProcessGoneDetail) gone,
  void Function(InAppWebViewController) terminated,
})
_processEnded(String name, Completer<Never> failed) {
  void fail(String why) {
    _windowLog('$name: $why');
    if (!failed.isCompleted) failed.completeError(TestFailure('$name: $why'));
  }

  return (
    gone: (_, detail) =>
        fail('page process ended (didCrash: ${detail.didCrash})'),
    terminated: (_) => fail('web content process ended'),
  );
}

void webViewWindows() {
  final shouldSkip = !InAppWebView.isPropertySupported(
    PlatformWebViewCreationParamsProperty.onCreateWindow,
  );

  skippableGroup('WebView Windows', () {
    final shouldSkipTest1 =
        kIsWeb ||
        !InAppWebView.isPropertySupported(
          PlatformWebViewCreationParamsProperty.onCreateWindow,
        );

    skippableTestWidgets('onCreateWindow return false', (
      WidgetTester tester,
    ) async {
      final Completer<InAppWebViewController> controllerCompleter =
          Completer<InAppWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(url: _openerUrl),
            initialSettings: InAppWebViewSettings(
              clearCache: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onLoadStop: (controller, url) {
              if (url!.toString() == _popupUrl.toString()) {
                pageLoaded.complete();
              }
            },
            onCreateWindow: (controller, createNavigationAction) async {
              controller.loadUrl(urlRequest: createNavigationAction.request);
              return false;
            },
          ),
        ),
      );
      await tester.pump();
      await expectLater(pageLoaded.future, completes);
    }, skip: shouldSkipTest1);

    final shouldSkipTest2 =
        kIsWeb ||
        !InAppWebView.isPropertySupported(
          PlatformWebViewCreationParamsProperty.windowId,
        );

    skippableTestWidgets('onCreateWindow return true', (
      WidgetTester tester,
    ) async {
      // Completes with an error when either page process ends: the test
      // then fails at once instead of waiting for a load that cannot come.
      final failed = Completer<Never>()..future.ignore();
      final openerEnded = _processEnded('opener', failed);
      final popupEnded = _processEnded('popup', failed);
      final Completer<int> onCreateWindowCompleter = Completer<int>();
      // The opener stays while its window loads, as an app shows a popup
      // over its page: replacing it tore its view down mid-handoff, and on
      // CI's Android emulator the window then never loaded.
      final openerKey = GlobalKey();
      final opener = InAppWebView(
        key: openerKey,
        initialUrlRequest: URLRequest(url: _openerUrl),
        initialSettings: InAppWebViewSettings(
          clearCache: true,
          javaScriptCanOpenWindowsAutomatically: true,
          supportMultipleWindows: true,
        ),
        onRenderProcessGone: openerEnded.gone,
        onWebContentProcessDidTerminate: openerEnded.terminated,
        onCreateWindow: (controller, createNavigationAction) async {
          onCreateWindowCompleter.complete(createNavigationAction.windowId);
          return true;
        },
      );
      await _windowStep(
        'pump the opener',
        _pumpUntilBuilt(
          tester,
          Directionality(textDirection: TextDirection.ltr, child: opener),
          openerKey,
        ),
        failed,
      );

      final windowId = await _windowStep(
        'onCreateWindow',
        onCreateWindowCompleter.future,
        failed,
      );

      final Completer<void> popupCreated = Completer<void>();
      final Completer<String> windowPageLoaded = Completer<String>();
      final Completer<void> onCloseWindowCompleter = Completer<void>();

      final popupKey = GlobalKey();
      await _windowStep(
        'pump the popup',
        _pumpUntilBuilt(
          tester,
          Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              children: [
                Expanded(child: opener),
                Expanded(
                  child: InAppWebView(
                    key: popupKey,
                    windowId: windowId,
                    initialSettings: InAppWebViewSettings(clearCache: true),
                    onWebViewCreated: (controller) {
                      popupCreated.complete();
                    },
                    onRenderProcessGone: popupEnded.gone,
                    onWebContentProcessDidTerminate: popupEnded.terminated,
                    onLoadStop: (controller, url) async {
                      if (url!.scheme != "about" &&
                          !windowPageLoaded.isCompleted) {
                        windowPageLoaded.complete(url.toString());
                        await controller.evaluateJavascript(
                          source: "window.close();",
                        );
                      }
                    },
                    onCloseWindow: (controller) {
                      onCloseWindowCompleter.complete();
                    },
                  ),
                ),
              ],
            ),
          ),
          popupKey,
        ),
        failed,
      );

      await _windowStep('popup onWebViewCreated', popupCreated.future, failed);
      final String windowUrlLoaded = await _windowStep(
        'popup onLoadStop',
        windowPageLoaded.future,
        failed,
      );
      expect(windowUrlLoaded, _popupUrl.toString());
      await _windowStep(
        'popup onCloseWindow',
        onCloseWindowCompleter.future,
        failed,
      );
    }, skip: shouldSkipTest2);

    final shouldSkipTest3 =
        kIsWeb ||
        !InAppWebView.isPropertySupported(
          PlatformWebViewCreationParamsProperty.onCreateWindow,
        );

    skippableTestWidgets(
      'window.open() with target _blank opens in same window',
      (WidgetTester tester) async {
        final Completer<InAppWebViewController> controllerCompleter =
            Completer<InAppWebViewController>();
        final StreamController<String> pageLoads =
            StreamController<String>.broadcast();
        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: InAppWebView(
              key: GlobalKey(),
              onWebViewCreated: (controller) {
                controllerCompleter.complete(controller);
              },
              initialUrlRequest: URLRequest(url: TEST_URL_ABOUT_BLANK),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                javaScriptCanOpenWindowsAutomatically: true,
              ),
              onLoadStop: (controller, url) {
                pageLoads.add(url!.toString());
              },
            ),
          ),
        );
        await pageLoads.stream.first;
        final InAppWebViewController controller =
            await controllerCompleter.future;

        await controller.evaluateJavascript(
          source: 'window.open("$TEST_URL_ABOUT_BLANK", "_blank");',
        );
        await pageLoads.stream.first;
        final String? currentUrl = (await controller.getUrl())?.toString();
        expect(currentUrl, TEST_URL_ABOUT_BLANK.toString());

        pageLoads.close();
      },
      skip: shouldSkipTest3,
    );

    // on Android, for some reason, it works on an example app but not in this test
    final shouldSkipTest4 =
        kIsWeb || defaultTargetPlatform == TargetPlatform.android;
    skippableTestWidgets('can open new window and go back', (
      WidgetTester tester,
    ) async {
      final Completer<InAppWebViewController> controllerCompleter =
          Completer<InAppWebViewController>();
      final StreamController<String> pageLoads =
          StreamController<String>.broadcast();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(url: TEST_CROSS_PLATFORM_URL_1),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
            onLoadStop: (controller, url) {
              pageLoads.add(url!.toString());
            },
          ),
        ),
      );

      await tester.pump();

      final InAppWebViewController controller =
          await controllerCompleter.future;

      Future<String> waitForUrl(String expectedUrl) async {
        await for (final url in pageLoads.stream) {
          if (url == expectedUrl) {
            return url;
          }
        }
        throw Exception('Stream closed without receiving $expectedUrl');
      }

      // Wait for initial page load
      await waitForUrl(TEST_CROSS_PLATFORM_URL_1.toString());
      await controller.evaluateJavascript(
        source: 'window.open("$TEST_URL_1", "_blank");',
      );
      final currentUrl = await waitForUrl(TEST_URL_1.toString());
      expect(currentUrl, contains(TEST_URL_1.host));

      await controller.goBack();
      final urlAfterGoBack = await waitForUrl(
        TEST_CROSS_PLATFORM_URL_1.toString(),
      );
      expect(urlAfterGoBack, contains(TEST_CROSS_PLATFORM_URL_1.host));

      pageLoads.close();
    }, skip: shouldSkipTest4);

    // Android blocks javascript: URLs opened from iframes for security reasons
    final shouldSkipTest5 = defaultTargetPlatform != TargetPlatform.android;
    skippableTestWidgets('javascript does not run in parent window', (
      WidgetTester tester,
    ) async {
      final String iframe = '''
        <!DOCTYPE html>
        <script>
          window.onload = () => {
            window.open(`javascript:
              var elem = document.createElement("p");
              elem.innerHTML = "<b>Executed JS in parent origin: " + window.location.origin + "</b>";
              document.body.append(elem);
            `);
          };
        </script>
      ''';
      final String iframeTestBase64 = base64Encode(
        const Utf8Encoder().convert(iframe),
      );

      final String openWindowTest =
          '''
        <!DOCTYPE html>
        <html>
        <head>
          <title>XSS test</title>
        </head>
        <body>
          <iframe
            onload="window.iframeLoaded = true;"
            src="data:text/html;charset=utf-8;base64,$iframeTestBase64"></iframe>
        </body>
        </html>
      ''';
      final String openWindowTestBase64 = base64Encode(
        const Utf8Encoder().convert(openWindowTest),
      );
      final Completer<InAppWebViewController> controllerCompleter =
          Completer<InAppWebViewController>();
      final Completer<void> pageLoadCompleter = Completer<void>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(
              url: WebUri(
                'data:text/html;charset=utf-8;base64,$openWindowTestBase64',
              ),
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
            onLoadStop: (controller, url) {
              pageLoadCompleter.complete();
            },
          ),
        ),
      );

      final InAppWebViewController controller =
          await controllerCompleter.future;
      await pageLoadCompleter.future;

      final iframeLoaded = await controller.evaluateJavascript(
        source: 'iframeLoaded',
      );
      expect(iframeLoaded, true);

      final pElement = await controller.evaluateJavascript(
        source:
            'document.querySelector("p") && document.querySelector("p").textContent',
      );
      expect(pElement, null);
    }, skip: shouldSkipTest5);

    // final shouldSkipTest6 = !kIsWeb;
    final shouldSkipTest6 = true;
    // on Web, opening a new window during tests makes crash
    skippableTestWidgets('onCreateWindow called on Web', (
      WidgetTester tester,
    ) async {
      final Completer<InAppWebViewController> controllerCompleter =
          Completer<InAppWebViewController>();
      final Completer<String> onCreateWindowCalled = Completer<String>();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(url: TEST_WEB_PLATFORM_URL_1),
            initialSettings: InAppWebViewSettings(
              clearCache: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onCreateWindow: (controller, createNavigationAction) async {
              onCreateWindowCalled.complete(
                createNavigationAction.request.url.toString(),
              );
              return false;
            },
          ),
        ),
      );

      final InAppWebViewController controller =
          await controllerCompleter.future;
      await controller.evaluateJavascript(
        source: "window.open('$TEST_CROSS_PLATFORM_URL_1');",
      );

      var url = await onCreateWindowCalled.future;
      expect(url, TEST_CROSS_PLATFORM_URL_1.toString());
    }, skip: shouldSkipTest6);
  }, skip: shouldSkip);
}

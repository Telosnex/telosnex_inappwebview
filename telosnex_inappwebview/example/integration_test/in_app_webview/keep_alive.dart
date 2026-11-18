part of 'main.dart';

void keepAlive() {
  final shouldSkip = !InAppWebView.isPropertySupported(
    PlatformInAppWebViewWidgetCreationParamsProperty.keepAlive,
  );

  final initialUrl = !kIsWeb
      ? testCrossPlatformUrl1
      : testWebPlatformUrl1;

  skippableTestWidgets('Keep Alive', (WidgetTester tester) async {
    final keepAlive = InAppWebViewKeepAlive();

    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<InAppWebViewController> controllerCompleter2 =
        Completer<InAppWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();
    final Completer<void> pageLoaded2 = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          keepAlive: keepAlive,
          initialUrlRequest: URLRequest(url: initialUrl),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            if (!pageLoaded.isCompleted &&
                initialUrl.toString() == url.toString()) {
              pageLoaded.complete();
            }
            // Host only: Bing can redirect to its page with tracking
            // parameters added.
            if (!pageLoaded2.isCompleted &&
                url?.host == testCrossPlatformUrl2.host) {
              pageLoaded2.complete();
            }
          },
        ),
      ),
    );

    final InAppWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    await controller.loadUrl(
      urlRequest: URLRequest(url: testCrossPlatformUrl2),
    );
    await pageLoaded2.future;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          keepAlive: keepAlive,
          onWebViewCreated: (controller) {
            controllerCompleter2.complete(controller);
          },
        ),
      ),
    );
    final InAppWebViewController controller2 =
        await controllerCompleter2.future;

    final String? currentUrl = (await controller2.getUrl())?.toString();
    expect(Uri.parse(currentUrl ?? '').host, testCrossPlatformUrl2.host);

    await expectLater(
      InAppWebViewController.disposeKeepAlive(keepAlive),
      completes,
    );
  }, skip: shouldSkip);
}

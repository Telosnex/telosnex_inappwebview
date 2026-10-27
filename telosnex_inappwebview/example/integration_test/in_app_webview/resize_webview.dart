part of 'main.dart';

void resizeWebView() {
  final shouldSkip =
      kIsWeb ||
      !InAppWebViewController.isMethodSupported(
        PlatformInAppWebViewControllerMethod.addJavaScriptHandler,
      );

  skippableTestWidgets('resize webview', (WidgetTester tester) async {
    final String resizeTest = '''
        <!DOCTYPE html><html>
        <head><title>Resize test</title>
          <script type="text/javascript">
            function onResize() {
              window.flutter_inappwebview.callHandler('resize');
            }
            function onLoad() {
              window.onresize = onResize;
            }
          </script>
        </head>
        <body onload="onLoad();" bgColor="blue">
        </body>
        </html>
      ''';
    final String resizeTestBase64 = base64Encode(
      const Utf8Encoder().convert(resizeTest),
    );
    final Completer<void> resizeCompleter = Completer<void>();
    final Completer<void> pageStarted = Completer<void>();
    var listenForResize = false;
    final Completer<void> pageLoaded = Completer<void>();
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final GlobalKey key = GlobalKey();

    final InAppWebView webView = InAppWebView(
      key: key,
      initialUrlRequest: URLRequest(
        url: WebUri('data:text/html;charset=utf-8;base64,$resizeTestBase64'),
      ),
      onWebViewCreated: (controller) {
        controllerCompleter.complete(controller);

        controller.addJavaScriptHandler(
          handlerName: 'resize',
          callback: (args) {
            // Windows sizes the view once after it is created, while the
            // page loads: only the test's own resize counts.
            if (listenForResize && !resizeCompleter.isCompleted) {
              resizeCompleter.complete(true);
            }
          },
        );
      },
      onLoadStart: (controller, url) {
        pageStarted.complete();
      },
      onLoadStop: (controller, url) {
        pageLoaded.complete();
      },
      initialSettings: InAppWebViewSettings(javaScriptEnabled: true),
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: <Widget>[SizedBox(width: 200, height: 200, child: webView)],
        ),
      ),
    );

    final controller = await controllerCompleter.future;
    await pageStarted.future;
    await pageLoaded.future;
    await tester.pump(const Duration(milliseconds: 500));
    final widthBefore = await controller.evaluateJavascript(
      source: 'window.innerWidth',
    );
    listenForResize = true;

    expect(resizeCompleter.isCompleted, false);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: <Widget>[SizedBox(width: 400, height: 400, child: webView)],
        ),
      ),
    );

    // Frames are drawn only when a test pumps; the platform view's resize
    // can need one to finish (Android's texture-backed views).
    final deadline = DateTime.now().add(const Duration(seconds: 20));
    while (!resizeCompleter.isCompleted && DateTime.now().isBefore(deadline)) {
      await tester.pump(const Duration(milliseconds: 100));
      await Future.delayed(const Duration(milliseconds: 100));
    }
    final widthAfter = await controller.evaluateJavascript(
      source: 'window.innerWidth',
    );
    expect(
      resizeCompleter.isCompleted,
      true,
      reason: 'no resize event; innerWidth $widthBefore -> $widthAfter',
    );
  }, skip: shouldSkip);
}

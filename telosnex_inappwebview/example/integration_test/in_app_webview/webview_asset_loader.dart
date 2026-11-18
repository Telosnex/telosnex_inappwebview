part of 'main.dart';

void webViewAssetLoader() {
  final shouldSkip = !InAppWebViewSettings.isPropertySupported(
    InAppWebViewSettingsProperty.webViewAssetLoader,
  );

  skippableTestWidgets('WebViewAssetLoader', (WidgetTester tester) async {
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<String> pageLoaded = Completer<String>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          initialUrlRequest: URLRequest(url: testWebviewAssetLoaderUrl),
          initialSettings: InAppWebViewSettings(
            allowFileAccessFromFileURLs: false,
            allowUniversalAccessFromFileURLs: false,
            allowFileAccess: false,
            allowContentAccess: false,
            webViewAssetLoader: WebViewAssetLoader(
              domain: testWebviewAssetLoaderDomain,
              pathHandlers: [AssetsPathHandler(path: '/assets/')],
            ),
          ),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete(url.toString());
          },
        ),
      ),
    );

    final InAppWebViewController controller = await controllerCompleter.future;
    final url = await pageLoaded.future;

    expect(url, testWebviewAssetLoaderUrl.toString());

    expect(
      await controller.evaluateJavascript(
        source: "document.querySelector('h1').innerHTML",
      ),
      'WebViewAssetLoader',
    );
  }, skip: shouldSkip);
}

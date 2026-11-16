part of 'main.dart';

void isLoading() {
  final shouldSkip = !InAppWebViewController.isMethodSupported(
    PlatformInAppWebViewControllerMethod.isLoading,
  );

  skippableTestWidgets('isLoading', (WidgetTester tester) async {
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<void> pageStarted = Completer<void>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          // The test server sends this page's image after 3 s, so the load
          // is still running when isLoading is asked.
          initialUrlRequest: URLRequest(
            url: WebUri(
              'http://${environment["NODE_SERVER_IP"]}:8082/slow-page',
            ),
          ),
          initialSettings: InAppWebViewSettings(clearCache: true),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStart: (controller, url) {
            pageStarted.complete();
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
        ),
      ),
    );

    final InAppWebViewController controller = await controllerCompleter.future;
    if (kIsWeb) {
      // Web: onLoadStart comes with the iframe's load event, right before
      // onLoadStop, so the load is checked from its start instead.
      expect(await controller.isLoading(), true);
    }
    await pageStarted.future;
    if (!kIsWeb) {
      expect(await controller.isLoading(), true);
    }

    await pageLoaded.future;
    expect(await controller.isLoading(), false);
  }, skip: shouldSkip);
}

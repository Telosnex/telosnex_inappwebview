part of 'main.dart';

void convertToInAppWebView() {
  final shouldSkip = !InAppWebView.isPropertySupported(
    PlatformInAppWebViewWidgetCreationParamsProperty.headlessWebView,
  );

  skippableTestWidgets('convert to InAppWebView', (WidgetTester tester) async {
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    var headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: testCrossPlatformUrl1),
      onWebViewCreated: (controller) {
        controllerCompleter.complete(controller);
      },
      onLoadStop: (controller, url) async {
        pageLoaded.complete();
      },
    );

    await headlessWebView.run();
    expect(headlessWebView.isRunning(), true);

    final InAppWebViewController controller = await controllerCompleter.future;
    await tester.pump();
    await pageLoaded.future;

    final String? url = (await controller.getUrl())?.toString();
    expect(url, testCrossPlatformUrl1.toString());

    final Completer<InAppWebViewController> widgetControllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<String> loadedUrl = Completer<String>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          headlessWebView: headlessWebView,
          onWebViewCreated: (controller) {
            widgetControllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            // Host only: Bing can redirect to its page with tracking
            // parameters added.
            if (url?.host == testCrossPlatformUrl2.host &&
                !loadedUrl.isCompleted) {
              loadedUrl.complete(url.toString());
            }
          },
        ),
      ),
    );
    final InAppWebViewController widgetController =
        await widgetControllerCompleter.future;
    await tester.pump();

    expect(headlessWebView.isRunning(), false);

    expect(
      (await widgetController.getUrl())?.toString(),
      testCrossPlatformUrl1.toString(),
    );

    await widgetController.loadUrl(
      urlRequest: URLRequest(url: testCrossPlatformUrl2),
    );
    expect(
      Uri.parse(await loadedUrl.future).host,
      testCrossPlatformUrl2.host,
    );
  }, skip: shouldSkip);
}

part of 'main.dart';

void runAndDispose() {
  final shouldSkip = !HeadlessInAppWebView.isMethodSupported(
    PlatformHeadlessInAppWebViewMethod.run,
  );

  skippableTest('run and dispose', () async {
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
    await pageLoaded.future;

    final String? url = (await controller.getUrl())?.toString();
    expect(url, testCrossPlatformUrl1.toString());

    await headlessWebView.dispose();

    expect(headlessWebView.isRunning(), false);
  }, skip: shouldSkip);
}

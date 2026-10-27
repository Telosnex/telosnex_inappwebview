part of 'main.dart';

void getCertificate() {
  final shouldSkip = !InAppWebViewController.isMethodSupported(
    PlatformInAppWebViewControllerMethod.getCertificate,
  );

  skippableTestWidgets('getCertificate', (WidgetTester tester) async {
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();
    Completer<void>? reloaded;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          initialUrlRequest: URLRequest(url: TEST_CROSS_PLATFORM_URL_1),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            if (!pageLoaded.isCompleted) {
              pageLoaded.complete();
            } else if (reloaded?.isCompleted == false) {
              reloaded!.complete();
            }
          },
        ),
      ),
    );

    final InAppWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    // Linux: WPE WebKit has no TLS info for a page served from its cache (an
    // earlier test loaded the same URL), so getCertificate is null. Load it
    // from the network.
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.linux) {
      reloaded = Completer<void>();
      await controller.reloadFromOrigin();
      await reloaded.future;
    }

    var sslCertificate = await controller.getCertificate();
    expect(sslCertificate, isNotNull);
    expect(sslCertificate!.x509Certificate, isNotNull);
    expect(sslCertificate.issuedBy, isNotNull);
    expect(sslCertificate.issuedTo, isNotNull);
    expect(sslCertificate.validNotAfterDate, isNotNull);
    expect(sslCertificate.validNotBeforeDate, isNotNull);
  }, skip: shouldSkip);
}

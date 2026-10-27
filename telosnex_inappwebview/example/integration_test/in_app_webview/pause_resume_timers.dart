part of 'main.dart';

void pauseResumeTimers() {
  final shouldSkip = !InAppWebViewController.isMethodSupported(
    PlatformInAppWebViewControllerMethod.pauseTimers,
  );

  skippableTestWidgets('pause/resume timers', (WidgetTester tester) async {
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          initialUrlRequest: URLRequest(url: TEST_URL_ABOUT_BLANK),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
        ),
      ),
    );

    final InAppWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    await controller.evaluateJavascript(
      source: """
      var count = 0;
      setInterval(function() {
        count = count + 10;
      }, 20);
      """,
    );

    // Measured while paused: ticks before the pause and right after the
    // resume vary with the device's speed.
    await controller.pauseTimers();
    await Future.delayed(const Duration(milliseconds: 200));
    final before = await controller.evaluateJavascript(source: "count;");
    await Future.delayed(const Duration(seconds: 2));
    final paused = await controller.evaluateJavascript(source: "count;");
    // At most one tick already queued when the pause arrived.
    expect(paused - before, lessThanOrEqualTo(10));
    await controller.resumeTimers();
    await Future.delayed(const Duration(seconds: 2));
    expect(
      await controller.evaluateJavascript(source: "count;"),
      greaterThan(paused + 50),
    );
  }, skip: shouldSkip);
}

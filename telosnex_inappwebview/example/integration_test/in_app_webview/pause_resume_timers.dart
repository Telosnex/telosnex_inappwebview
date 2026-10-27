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

    // Relative to the count just before the pause: the ticks before it vary
    // with the device's speed. Read only while running: macOS does not run
    // JavaScript while timers are paused.
    final before = await controller.evaluateJavascript(source: "count;");
    await controller.pauseTimers();
    await Future.delayed(const Duration(seconds: 2));
    await controller.resumeTimers();
    final after = await controller.evaluateJavascript(source: "count;");
    // 2 seconds running would add 1000.
    expect(after - before, lessThan(500));
    await Future.delayed(const Duration(seconds: 2));
    expect(
      await controller.evaluateJavascript(source: "count;"),
      greaterThan(after + 50),
    );
  }, skip: shouldSkip);
}

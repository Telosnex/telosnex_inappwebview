part of 'main.dart';

void pageDownUp() {
  final shouldSkip = !InAppWebViewController.isMethodSupported(
    PlatformInAppWebViewControllerMethod.pageDown,
  );

  skippableTestWidgets('pageDown/pageUp', (WidgetTester tester) async {
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          // A local page taller than the view: a live site's height and
          // layout time vary.
          initialData: InAppWebViewInitialData(
            data:
                '<!DOCTYPE html><html><head><meta name="viewport" '
                'content="width=device-width, initial-scale=1"></head>'
                '<body style="margin:0"><div style="height:10000px"></div>'
                '</body></html>',
          ),
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
    await tester.pump();
    // pageDown is false until the page is laid out taller than the view.
    // Frames are drawn only when a test pumps.
    final deadline = DateTime.now().add(const Duration(seconds: 20));
    var scrolledDown = false;
    while (!scrolledDown && DateTime.now().isBefore(deadline)) {
      scrolledDown = await controller.pageDown(bottom: false);
      if (!scrolledDown) {
        await tester.pump(const Duration(milliseconds: 200));
      }
    }
    expect(scrolledDown, true);
    // The scroll is animated: pageUp is true once it has moved down.
    var scrolledUp = false;
    while (!scrolledUp && DateTime.now().isBefore(deadline)) {
      await tester.pump(const Duration(milliseconds: 200));
      scrolledUp = await controller.pageUp(top: false);
    }
    expect(scrolledUp, true);
  }, skip: shouldSkip);
}

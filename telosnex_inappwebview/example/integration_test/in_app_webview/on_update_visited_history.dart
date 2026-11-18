part of 'main.dart';

void onUpdateVisitedHistory() {
  final shouldSkip = !InAppWebView.isPropertySupported(
    PlatformWebViewCreationParamsProperty.onUpdateVisitedHistory,
  );

  var url = !kIsWeb ? testCrossPlatformUrl1 : testWebPlatformUrl1;

  skippableTestWidgets('onUpdateVisitedHistory', (WidgetTester tester) async {
    final Completer<InAppWebViewController> controllerCompleter =
        Completer<InAppWebViewController>();
    final Completer<String> firstPushCompleter = Completer<String>();
    final Completer<String> secondPushCompleter = Completer<String>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          initialUrlRequest: URLRequest(url: url),
          initialSettings: InAppWebViewSettings(clearCache: true),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
          onUpdateVisitedHistory: (controller, url, androidIsReload) async {
            if (url!.toString().endsWith("second-push")) {
              secondPushCompleter.complete(url.toString());
            } else if (url.toString().endsWith("first-push")) {
              firstPushCompleter.complete(url.toString());
            }
          },
        ),
      ),
    );

    final InAppWebViewController controller = await controllerCompleter.future;
    await tester.pump();
    await pageLoaded.future;

    await controller.evaluateJavascript(
      source: """
var state = {}
var title = ''
var url = 'first-push';
history.pushState(state, title, url);

setTimeout(function() {
    var url = 'second-push';
    history.pushState(state, title, url);
}, 500);
""",
    );

    var firstPushUrl = await firstPushCompleter.future;
    expect(
      firstPushUrl,
      '${!kIsWeb ? testCrossPlatformUrl1 : testWebPlatformBaseUrl}first-push',
    );

    var secondPushUrl = await secondPushCompleter.future;
    expect(
      secondPushUrl,
      '${!kIsWeb ? testCrossPlatformUrl1 : testWebPlatformBaseUrl}second-push',
    );
  }, skip: shouldSkip);
}

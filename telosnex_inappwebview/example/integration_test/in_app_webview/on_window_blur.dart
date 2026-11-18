part of 'main.dart';

void onWindowBlur() {
  final shouldSkip = !InAppWebView.isPropertySupported(
    PlatformWebViewCreationParamsProperty.onWindowBlur,
  );

  var url = !kIsWeb ? testUrl1 : testWebPlatformUrl1;

  skippableTestWidgets('onWindowBlur', (WidgetTester tester) async {
    final Completer<void> onWindowBlurCompleter = Completer<void>();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: InAppWebView(
          key: GlobalKey(),
          initialUrlRequest: URLRequest(url: url),
          onLoadStop: (controller, url) async {
            await controller.evaluateJavascript(
              source: 'window.dispatchEvent(new Event("blur"));',
            );
          },
          onWindowBlur: (controller) {
            onWindowBlurCompleter.complete();
          },
        ),
      ),
    );
    await tester.pump();
    await expectLater(onWindowBlurCompleter.future, completes);
  }, skip: shouldSkip);
}

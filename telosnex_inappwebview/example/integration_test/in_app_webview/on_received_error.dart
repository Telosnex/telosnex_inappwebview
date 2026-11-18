part of 'main.dart';

void onReceivedError() {
  final shouldSkip = !InAppWebView.isPropertySupported(
    PlatformWebViewCreationParamsProperty.onReceivedError,
  );

  skippableGroup('onReceivedError', () {
    skippableTestWidgets('invalid url', (WidgetTester tester) async {
      final Completer<String> errorUrlCompleter = Completer<String>();
      final Completer<WebResourceErrorType> errorCodeCompleter =
          Completer<WebResourceErrorType>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(url: testNotAWebsiteUrl),
            onReceivedError: (controller, request, error) {
              errorUrlCompleter.complete(request.url.toString());
              errorCodeCompleter.complete(error.type);
            },
          ),
        ),
      );

      final String url = await errorUrlCompleter.future;
      final WebResourceErrorType errorType = await errorCodeCompleter.future;

      expect(errorType, WebResourceErrorType.HOST_LOOKUP);
      expect(url, testNotAWebsiteUrl.toString());
    });

    skippableTestWidgets('event is not called with valid url', (
      WidgetTester tester,
    ) async {
      final Completer<void> onReceivedErrorCompleter = Completer<void>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(
              url: WebUri(
                'data:text/html;charset=utf-8;base64,PCFET0NUWVBFIGh0bWw+',
              ),
            ),
            onReceivedError: (controller, request, error) {
              onReceivedErrorCompleter.complete();
            },
          ),
        ),
      );

      expect(onReceivedErrorCompleter.future, doesNotComplete);
    });
  }, skip: shouldSkip);
}

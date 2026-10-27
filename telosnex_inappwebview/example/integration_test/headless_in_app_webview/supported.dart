part of 'main.dart';

void supported() {
  skippableGroup('supported', () {
    skippableTestWidgets('basic', (WidgetTester tester) async {
      expect(HeadlessInAppWebView.isClassSupported(), true);
      expect(
        HeadlessInAppWebView.isPropertySupported(
          PlatformHeadlessInAppWebViewCreationParamsProperty.initialSize,
        ),
        true,
      );
      expect(
        HeadlessInAppWebView.isPropertySupported(
          PlatformHeadlessInAppWebViewCreationParamsProperty.webViewEnvironment,
        ),
        // On the web, defaultTargetPlatform is the browser's OS.
        !kIsWeb &&
            (defaultTargetPlatform == TargetPlatform.windows ||
                defaultTargetPlatform == TargetPlatform.linux),
      );
      expect(
        HeadlessInAppWebView.isMethodSupported(
          PlatformHeadlessInAppWebViewMethod.run,
        ),
        true,
      );
      expect(
        HeadlessInAppWebView.isMethodSupported(
          PlatformHeadlessInAppWebViewMethod.dispose,
        ),
        true,
      );
    }, skip: false);
  }, skip: false);
}

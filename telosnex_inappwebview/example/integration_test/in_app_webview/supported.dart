part of 'main.dart';

void supported() {
  skippableGroup('supported', () {
    // On the web, defaultTargetPlatform is the browser's OS: none of the
    // platform-specific APIs below are supported there.
    skippableTestWidgets('basic', (WidgetTester tester) async {
      expect(InAppWebViewController.isClassSupported(), true);
      expect(
        InAppWebViewController.isPropertySupported(
          PlatformInAppWebViewControllerProperty.webStorage,
        ),
        true,
      );
      expect(
        InAppWebViewController.isMethodSupported(
          PlatformInAppWebViewControllerMethod.startSafeBrowsing,
        ),
        !kIsWeb && defaultTargetPlatform == TargetPlatform.android,
      );
      expect(
        InAppWebViewController.isMethodSupported(
          PlatformInAppWebViewControllerMethod.createPdf,
        ),
        !kIsWeb &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(defaultTargetPlatform),
      );
      expect(
        InAppWebViewController.isMethodSupported(
          PlatformInAppWebViewControllerMethod.clearSslPreferences,
        ),
        !kIsWeb &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(defaultTargetPlatform),
      );
      expect(
        InAppWebViewController.isMethodSupported(
          PlatformInAppWebViewControllerMethod.openDevTools,
        ),
        !kIsWeb && defaultTargetPlatform == TargetPlatform.windows,
      );

      expect(InAppWebView.isClassSupported(), true);
      expect(
        InAppWebView.isPropertySupported(
          PlatformWebViewCreationParamsProperty.initialSettings,
        ),
        true,
      );
      expect(
        InAppWebView.isPropertySupported(
          PlatformWebViewCreationParamsProperty.windowId,
        ),
        true,
      );
      expect(
        InAppWebView.isPropertySupported(
          PlatformInAppWebViewWidgetCreationParamsProperty.preventGestureDelay,
        ),
        !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS,
      );
      expect(
        InAppWebView.isPropertySupported(
          PlatformWebViewCreationParamsProperty.onWebContentProcessDidTerminate,
        ),
        !kIsWeb &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(defaultTargetPlatform),
      );
      expect(
        InAppWebView.isPropertySupported(
          PlatformWebViewCreationParamsProperty.onAcceleratorKeyPressed,
        ),
        !kIsWeb && defaultTargetPlatform == TargetPlatform.windows,
      );

      expect(
        InAppWebViewSettings.isPropertySupported(
          InAppWebViewSettingsProperty.algorithmicDarkeningAllowed,
        ),
        !kIsWeb && defaultTargetPlatform == TargetPlatform.android,
      );
      expect(
        InAppWebViewSettings.isPropertySupported(
          InAppWebViewSettingsProperty.allowsBackForwardNavigationGestures,
        ),
        !kIsWeb &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(defaultTargetPlatform),
      );
      expect(
        InAppWebViewSettings.isPropertySupported(
          InAppWebViewSettingsProperty.handleAcceleratorKeyPressed,
        ),
        !kIsWeb && defaultTargetPlatform == TargetPlatform.windows,
      );
    }, skip: false);
  }, skip: false);
}

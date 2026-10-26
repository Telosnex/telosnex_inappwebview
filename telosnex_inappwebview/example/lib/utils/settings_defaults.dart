import 'package:telosnex_inappwebview/telosnex_inappwebview.dart';

InAppWebViewSettings defaultInAppWebViewSettings() {
  return InAppWebViewSettings();
}

WebViewEnvironmentSettings defaultWebViewEnvironmentSettings() {
  return WebViewEnvironmentSettings();
}

Map<String, dynamic> defaultInAppWebViewSettingsMap() {
  return defaultInAppWebViewSettings().toMap(
    enumMethod: EnumMethod.nativeValue,
  );
}

Map<String, dynamic> defaultWebViewEnvironmentSettingsMap() {
  return defaultWebViewEnvironmentSettings().toMap(
    enumMethod: EnumMethod.nativeValue,
  );
}

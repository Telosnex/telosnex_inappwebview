// The integration tests' "supported" groups (only flags, no WebView) for
// each platform, here as widget tests, so the flags are checked on every
// push. A platform's flags come from the interface's annotations.
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telosnex_inappwebview_android/telosnex_inappwebview_android.dart';
import 'package:telosnex_inappwebview_ios/telosnex_inappwebview_ios.dart';
import 'package:telosnex_inappwebview_linux/telosnex_inappwebview_linux.dart';
import 'package:telosnex_inappwebview_macos/telosnex_inappwebview_macos.dart';
import 'package:telosnex_inappwebview_windows/telosnex_inappwebview_windows.dart';

import '../integration_test/headless_in_app_webview/main.dart' as headless;
import '../integration_test/in_app_browser/main.dart' as browser;
import '../integration_test/in_app_webview/main.dart' as webview;
import '../integration_test/util.dart';

void main() {
  final platforms = <TargetPlatform, void Function()>{
    TargetPlatform.android: AndroidInAppWebViewPlatform.registerWith,
    TargetPlatform.iOS: IOSInAppWebViewPlatform.registerWith,
    TargetPlatform.macOS: MacOSInAppWebViewPlatform.registerWith,
    TargetPlatform.windows: WindowsInAppWebViewPlatform.registerWith,
    TargetPlatform.linux: LinuxInAppWebViewPlatform.registerWith,
  };
  for (final entry in platforms.entries) {
    group(entry.key.name, () {
      setUp(() {
        testPlatformOverride = entry.key;
        entry.value();
      });
      tearDown(() => testPlatformOverride = null);
      webview.supported();
      headless.supported();
      browser.supported();
    });
  }
}

import 'package:flutter/foundation.dart';
import 'package:telosnex_inappwebview_platform_interface/telosnex_inappwebview_platform_interface.dart';

// A platform plugin registers a subclass of InAppWebViewPlatform.
class ExampleWebViewPlatform extends InAppWebViewPlatform {
  static void registerWith() {
    InAppWebViewPlatform.instance = ExampleWebViewPlatform();
  }

  @override
  PlatformCookieManager createPlatformCookieManager(
    PlatformCookieManagerCreationParams params,
  ) => _ExampleCookieManager(params);
}

class _ExampleCookieManager extends PlatformCookieManager {
  _ExampleCookieManager(super.params) : super.implementation();

  @override
  Future<List<Cookie>> getCookies({
    required WebUri url,
    PlatformInAppWebViewController? iosBelow11WebViewController,
    PlatformInAppWebViewController? webViewController,
  }) async {
    // A real implementation reads from the platform's WebView cookie store.
    return url.host == 'example.com'
        ? [Cookie(name: 'theme', value: 'dark')]
        : [];
  }
}

Future<void> main() async {
  ExampleWebViewPlatform.registerWith();

  // The factory delegates to the registered platform implementation.
  final manager = PlatformCookieManager(
    const PlatformCookieManagerCreationParams(),
  );
  final cookies = await manager.getCookies(url: WebUri('https://example.com'));
  debugPrint('Cookies for example.com: ${cookies.length}');
}

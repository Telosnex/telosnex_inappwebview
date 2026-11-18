import 'package:telosnex_inappwebview/telosnex_inappwebview.dart';

final testUrlAboutBlank = WebUri('about:blank');
// No video: flutter.dev's .mp4 files fail where the WebView has no H.264
// (AOSP), and then onLoadStop never comes.
final testCrossPlatformUrl1 = WebUri('https://www.example.com/');
final testCrossPlatformUrl2 = WebUri('https://www.bing.com/');
final testUrl1 = WebUri('https://github.com/flutter');
final testUrl2 = WebUri('https://www.google.com/');
final testUrl3 = WebUri(
  'https://github.com/pichillilorenzo/flutter_inappwebview',
);
final testUrl4 = WebUri('https://www.youtube.com/');
final testUrlExample = WebUri('https://www.example.com/');
final testUrlHttpExample = WebUri('http://www.example.com/');
final testUrl404 = WebUri('https://google.com/404');
final testWebPlatformBaseUrl = WebUri(
  Uri.base.toString().replaceFirst("/#/", "/"),
);
final testWebPlatformUrl1 = WebUri(
  '${testWebPlatformBaseUrl}page.html',
);
final testWebPlatformUrl2 = WebUri(
  '${testWebPlatformBaseUrl}page-2.html',
);
final testWebPlatformUrl3 = WebUri(
  '${testWebPlatformBaseUrl}heavy-page.html',
);
final testNotAWebsiteUrl = WebUri('https://www.notawebsite..com/');
final testChromeSafeBrowsingMalware = WebUri(
  'chrome://safe-browsing/match?type=malware',
);
final testPermissionSite = WebUri('https://permission.site/');
final testServiceWorkerUrl = WebUri(
  'https://mdn.github.io/dom-examples/service-worker/simple-service-worker/',
);
const testWebviewAssetLoaderDomain = 'my.custom.domain.com';
final testWebviewAssetLoaderUrl = WebUri(
  'https://$testWebviewAssetLoaderDomain/assets/flutter_assets/test_assets/website/index.html',
);
final testTwaUrl = WebUri(
  'https://inappwebview.dev/test-twa-postmessage.html',
);
final testCustomTabsPostMessageUrl = WebUri(
  'https://inappwebview.dev/test-twa-postmessage.html',
);

## 1.0.1

- Requires `telosnex_inappwebview_platform_interface` 1.1.0.
- Fix analyzer lints. No behavior changes.

## 1.0.0

First release of `telosnex_inappwebview_linux`. It is a fork of `flutter_inappwebview_linux` 0.1.0-beta.1 by Lorenzo Pichilli.

- Renamed from `flutter_inappwebview_linux`. The native names changed too: the C++ plugin class and the method channels. An app can contain this package and `flutter_inappwebview` together.
- Uses the WPEPlatform API only. It needs WPE WebKit 2.50 or later, built with WPEPlatform. The WPEBackend-FDO fallback is removed.
- The build downloads a pinned, prebuilt, relocatable WPE WebKit SDK (WPE WebKit 2.54.2) and bundles it with the app. See [WPE_BACKEND.md](https://github.com/Telosnex/telosnex_inappwebview/blob/master/telosnex_inappwebview_linux/WPE_BACKEND.md).
- If runtime packages for the SDK are missing, the build names them.
- Cookies persist across restarts.
- Visible webviews are not black on GPU hardware.
- Fixes for crashes, security, and behavior from a review of `in_app_webview.cc`. See [REVIEW_in_app_webview.md](https://github.com/Telosnex/telosnex_inappwebview/blob/master/telosnex_inappwebview_linux/REVIEW_in_app_webview.md).
- The origin allow lists for scripts are enforced. `onLoadStop` is called only for the current load.
- Headless webviews install initial user scripts before they load content. Dispose waits for startup. Dart controllers are released when startup fails.
- JavaScript handler replies arrive as JSON. Before, objects arrived as `{}`.
- DNS errors are `HOST_LOOKUP`. `WebsiteDataType.ALL` clears every WebKit data type.
- `FormData` bodies are bytes. The `onLoad` and `onError` callbacks of injected scripts are called.
- When WebKit cancels a client certificate request, the page loads again.

## Upstream history

The entries below are from `flutter_inappwebview_linux`. They use its version numbers.

## 0.1.0-beta.1

- Initial release.

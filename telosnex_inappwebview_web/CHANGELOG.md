## 1.0.0

First release of `telosnex_inappwebview_web`. It is a fork of `flutter_inappwebview_web` 1.2.0-beta.3 by Lorenzo Pichilli.

- Renamed from `flutter_inappwebview_web`.
- A headless webview reads `initialUserScripts` and sets `windowId`.
- A POST response loads from a `blob:` URL, which has the origin of the app. Scripts, user scripts, and events work on it. Before, it was a `data:` URL.
- `postUrl` sends `Content-Type: application/x-www-form-urlencoded`.
- The empty `about:blank` of the iframe, before the first load, is not reported as a page load.
- `isLoading` is `true` from the start of a load.
- `removeUserOnlyScript` finds the script by its value.

## Upstream history

The entries below are from `flutter_inappwebview_web`. They use its version numbers.

## 1.2.0-beta.3

- Updated flutter_inappwebview_platform_interface version to ^1.4.0-beta.3
- Updated `onCreateWindow` WebView event
- Implemented `onCloseWindow`, `onCallJsHandler` WebView events
- Implemented `addJavaScriptHandler`, `removeJavaScriptHandler`, `hasJavaScriptHandler`, `addUserScript`, `addUserScripts`, `removeUserScript`, `removeUserScriptsByGroupName`, `removeUserScripts`, `hasUserScript` InAppWebViewController methods
- Implemented `setJavaScriptBridgeName`, `getJavaScriptBridgeName`, `getDefaultUserAgent` InAppWebViewController static methods
- Implemented `javaScriptHandlersOriginAllowList`, `javaScriptBridgeEnabled`, `javaScriptBridgeOriginAllowList`, `hasJavaScriptHandler`, `addUserScript`, `addUserScripts`, `removeUserScript` InAppWebViewSettings event
- Merged "fix #2484, Remove not-empty assert for Cookie.value" [#2486](https://github.com/pichillilorenzo/flutter_inappwebview/pull/2486) (thanks to [laishere](https://github.com/laishere))

## 1.2.0-beta.2

- Updated flutter_inappwebview_platform_interface version to ^1.4.0-beta.2

## 1.2.0-beta.1

- Updated flutter_inappwebview_platform_interface version to ^1.4.0-beta.1
- Merged "[web] support iframe role and aria-hidden attributes" [2293](https://github.com/pichillilorenzo/flutter_inappwebview/pull/2293) (thanks to [p-mazhnik](https://github.com/p-mazhnik))
- Fixed 'Type 'int' is not a subtype of type 'JSValue' in type cast' when compiling/running using WASM

## 1.1.2

- Updated flutter_inappwebview_platform_interface version to ^1.3.0

## 1.1.1

- Updated flutter_inappwebview_platform_interface version to ^1.2.0

## 1.1.0+2

- Updated flutter_inappwebview_platform_interface version

## 1.1.0+1

- Updated pubspec.yaml

## 1.1.0
 
- Migrates package to `package:web`.
- Updates minimum supported SDK version to Flutter 3.24/Dart 3.5.

## 1.0.8

- Updated `flutter_inappwebview_platform_interface` version dependency to `^1.0.10`

## 1.0.7

- Updated `flutter_inappwebview_platform_interface` version dependency to `^1.0.9`

## 1.0.6

- Updated `flutter_inappwebview_platform_interface` version dependency to `^1.0.8`

## 1.0.5

- Updated `flutter_inappwebview_platform_interface` version dependency to `^1.0.7`

## 1.0.4

- Updated `flutter_inappwebview_platform_interface` version dependency to `^1.0.6`
- Updated `CookieManager` methods return value

## 1.0.3

- Fixed "Flutter 3.7.10 error Dart library 'dart:ui_web' is not available on this platform" [#1900](https://github.com/pichillilorenzo/flutter_inappwebview/issues/1900)
- Try to load just the URL of an URLRequest if the HTTP method is GET and the HTTP request fails due to an error, such as a CORS policy error 

## 1.0.2

- Updated `flutter_inappwebview_platform_interface` version dependency to `^1.0.5`

## 1.0.1

- Updated `flutter_inappwebview_platform_interface` version dependency to `^1.0.2`

## 1.0.0

Initial release.

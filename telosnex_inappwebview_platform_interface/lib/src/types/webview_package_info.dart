import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'enum_method.dart';

part 'webview_package_info.g.dart';

///Class that represents a `WebView` package info.
@ExchangeableObject()
class WebViewPackageInfoSpec {
  ///The version name of this WebView package.
  String? versionName;

  ///The name of this WebView package.
  String? packageName;

  WebViewPackageInfoSpec({this.versionName, this.packageName});
}

///Class that represents an Android `WebView` package info.
///Use [WebViewPackageInfo] instead.
@Deprecated("Use WebViewPackageInfo instead")
@ExchangeableObject()
class AndroidWebViewPackageInfoSpec {
  ///The version name of this WebView package.
  String? versionName;

  ///The name of this WebView package.
  String? packageName;

  AndroidWebViewPackageInfoSpec({this.versionName, this.packageName});
}

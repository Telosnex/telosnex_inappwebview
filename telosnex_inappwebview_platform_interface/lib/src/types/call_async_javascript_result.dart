import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../in_app_webview/platform_inappwebview_controller.dart';
import 'enum_method.dart';

part 'call_async_javascript_result.g.dart';

///Class that represents either a success or a failure, including an associated value in each case for [PlatformInAppWebViewController.callAsyncJavaScript].
@ExchangeableObject()
class CallAsyncJavaScriptResultSpec {
  ///It contains the success value.
  dynamic value;

  ///It contains the failure value.
  String? error;

  CallAsyncJavaScriptResultSpec({this.value, this.error});
}

import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'package:flutter/foundation.dart';

import 'web_resource_error_type.dart';
import 'enum_method.dart';

part 'web_resource_error.g.dart';

// An error code without a type (WebKit's error domain, for example) used to
// fail the whole event (a null check), so onReceivedError was never called.
WebResourceErrorType _deserializeType(dynamic type, {EnumMethod? enumMethod}) {
  final parsed = switch (enumMethod ?? EnumMethod.nativeValue) {
    EnumMethod.nativeValue => WebResourceErrorType.fromNativeValue(type),
    EnumMethod.value => WebResourceErrorType.fromValue(type),
    EnumMethod.name => WebResourceErrorType.byName(type),
  };
  if (parsed != null) return parsed;
  // NSURLErrorDNSLookupFailed: what cannotFindHost (-1003) is on some
  // networks, the GitHub macOS runners' for one.
  if (type == -1006 &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS)) {
    return WebResourceErrorType.HOST_LOOKUP;
  }
  return WebResourceErrorType.UNKNOWN;
}

///Encapsulates information about errors occurred during loading of web resources.
@ExchangeableObject()
class WebResourceError_ {
  ///The type of the error. [WebResourceErrorType.UNKNOWN] when the platform
  ///reports a code that has no type here.
  @ExchangeableObjectProperty(deserializer: _deserializeType)
  WebResourceErrorType_ type;

  ///The string describing the error.
  String description;

  WebResourceError_({required this.type, required this.description});
}

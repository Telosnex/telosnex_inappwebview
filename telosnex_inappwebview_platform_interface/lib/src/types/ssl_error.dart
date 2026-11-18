import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'enum_method.dart';
import 'ssl_error_type.dart';

part 'ssl_error.g.dart';

///Class that represents an SSL Error.
@ExchangeableObject()
class SslErrorSpec {
  ///Use [code] instead.
  @Deprecated('Use code instead')
  AndroidSslErrorSpec? androidError;

  ///Use [code] instead.
  @Deprecated('Use code instead')
  IOSSslErrorSpec? iosError;

  ///Primary code error associated to the server SSL certificate.
  ///It represents the most severe SSL error.
  SslErrorTypeSpec? code;

  ///The message associated to the [code].
  String? message;

  SslErrorSpec({
    @Deprecated('Use code instead') this.androidError,
    @Deprecated('Use code instead') this.iosError,
    this.code,
    this.message,
  });
}

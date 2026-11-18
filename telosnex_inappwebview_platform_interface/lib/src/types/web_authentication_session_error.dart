import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'web_authentication_session_error.g.dart';

///Class that represents the error code for a web authentication session error.
@ExchangeableEnum()
class WebAuthenticationSessionErrorSpec {
  // ignore: unused_field
  final int _value;
  const WebAuthenticationSessionErrorSpec._internal(this._value);

  ///The login has been canceled.
  static const CANCELED_LOGIN = WebAuthenticationSessionErrorSpec._internal(1);

  ///A context wasn’t provided.
  static const PRESENTATION_CONTEXT_NOT_PROVIDED =
      WebAuthenticationSessionErrorSpec._internal(2);

  ///The context was invalid.
  static const PRESENTATION_CONTEXT_INVALID =
      WebAuthenticationSessionErrorSpec._internal(3);
}

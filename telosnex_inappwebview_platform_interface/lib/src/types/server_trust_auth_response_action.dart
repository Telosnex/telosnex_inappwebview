import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'server_trust_auth_response.dart';

part 'server_trust_auth_response_action.g.dart';

///Class used by [ServerTrustAuthResponse] class.
@ExchangeableEnum()
class ServerTrustAuthResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const ServerTrustAuthResponseActionSpec._internal(this._value);

  ///Instructs the WebView to cancel the authentication challenge.
  static const CANCEL = ServerTrustAuthResponseActionSpec._internal(0);

  ///Instructs the WebView to proceed with the authentication challenge.
  static const PROCEED = ServerTrustAuthResponseActionSpec._internal(1);
}

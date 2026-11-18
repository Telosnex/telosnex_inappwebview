import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'client_cert_response.dart';

part 'client_cert_response_action.g.dart';

///Class used by [ClientCertResponse] class.
@ExchangeableEnum()
class ClientCertResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const ClientCertResponseActionSpec._internal(this._value);

  ///Cancel this request.
  static const CANCEL = ClientCertResponseActionSpec._internal(0);

  ///Proceed with the specified certificate.
  static const PROCEED = ClientCertResponseActionSpec._internal(1);

  ///Ignore the request for now.
  static const IGNORE = ClientCertResponseActionSpec._internal(2);
}

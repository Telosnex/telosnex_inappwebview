import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'fetch_request.dart';

part 'fetch_request_action.g.dart';

///Class used by [FetchRequest] class.
@ExchangeableEnum()
class FetchRequestActionSpec {
  // ignore: unused_field
  final int _value;
  const FetchRequestActionSpec._internal(this._value);

  ///Aborts the fetch request.
  static const ABORT = FetchRequestActionSpec._internal(0);

  ///Proceeds with the fetch request.
  static const PROCEED = FetchRequestActionSpec._internal(1);
}

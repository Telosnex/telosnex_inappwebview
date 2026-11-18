import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'ajax_request.dart';

part 'ajax_request_ready_state.g.dart';

///Class used by [AjaxRequest] class. It represents the state of an [AjaxRequest].
@ExchangeableEnum()
class AjaxRequestReadyStateSpec {
  // ignore: unused_field
  final int _value;
  const AjaxRequestReadyStateSpec._internal(this._value);

  ///Client has been created. `XMLHttpRequest.open()` not called yet.
  static const UNSENT = AjaxRequestReadyStateSpec._internal(0);

  ///`XMLHttpRequest.open()` has been called.
  static const OPENED = AjaxRequestReadyStateSpec._internal(1);

  ///`XMLHttpRequest.send()` has been called, and [AjaxRequest.headers] and [AjaxRequest.status] are available.
  static const HEADERS_RECEIVED = AjaxRequestReadyStateSpec._internal(2);

  ///Downloading; [AjaxRequest.responseText] holds partial data.
  static const LOADING = AjaxRequestReadyStateSpec._internal(3);

  ///The operation is complete.
  static const DONE = AjaxRequestReadyStateSpec._internal(4);
}

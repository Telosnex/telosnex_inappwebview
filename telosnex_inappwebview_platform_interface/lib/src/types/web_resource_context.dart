import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'web_resource_context.g.dart';

///Constants that describe the web resource request contexts.
@ExchangeableEnum()
class WebResourceContextSpec {
  // ignore: unused_field
  final int _value;
  const WebResourceContextSpec._internal(this._value);

  ///All resources.
  static const ALL = WebResourceContextSpec._internal(0);

  ///Document resource.
  static const DOCUMENT = WebResourceContextSpec._internal(1);

  ///CSS resource.
  static const STYLESHEET = WebResourceContextSpec._internal(2);

  ///Image resource.
  static const IMAGE = WebResourceContextSpec._internal(3);

  ///Media resource.
  static const MEDIA = WebResourceContextSpec._internal(4);

  ///Font resource.
  static const FONT = WebResourceContextSpec._internal(5);

  ///Script resource.
  static const SCRIPT = WebResourceContextSpec._internal(6);

  ///XML HTTP request resource.
  static const XML_HTTP_REQUEST = WebResourceContextSpec._internal(7);

  ///Fetch API resource.
  static const FETCH = WebResourceContextSpec._internal(8);

  ///TextTrack resource.
  static const TEXT_TRACK = WebResourceContextSpec._internal(9);

  ///EventSource resource.
  static const EVENT_SOURCE = WebResourceContextSpec._internal(10);

  ///WebSocket resource.
  static const WEBSOCKET = WebResourceContextSpec._internal(11);

  ///Web App Manifest resource.
  static const MANIFEST = WebResourceContextSpec._internal(12);

  ///Signed HTTP Exchange resource.
  static const SIGNED_EXCHANGE = WebResourceContextSpec._internal(13);

  ///Ping request.
  static const PING = WebResourceContextSpec._internal(14);

  ///CSP Violation Report resource.
  static const CSP_VIOLATION_REPORT = WebResourceContextSpec._internal(15);

  ///Other resource.
  static const OTHER = WebResourceContextSpec._internal(16);
}

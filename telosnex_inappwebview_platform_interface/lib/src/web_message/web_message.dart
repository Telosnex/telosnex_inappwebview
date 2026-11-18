import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../platform_webview_feature.dart';
import 'platform_web_message_port.dart';
import '../types/enum_method.dart';

part 'web_message.g.dart';

///The Dart representation of the HTML5 PostMessage event.
///See https://html.spec.whatwg.org/multipage/comms.html#the-messageevent-interfaces for definition of a MessageEvent in HTML5.
@ExchangeableObject(fromMapForceAllInline: true)
class WebMessageSpec {
  ///The data of the message.
  dynamic data;

  ///The payload type of the message.
  WebMessageTypeSpec type;

  ///The ports that are sent with the message.
  List<IWebMessagePort>? ports;

  @ExchangeableObjectConstructor()
  WebMessageSpec({
    this.data,
    this.type = WebMessageTypeSpec.STRING,
    this.ports,
  }) {
    assert(
      ((data == null || data is String) && type == WebMessageTypeSpec.STRING) ||
          (data != null &&
              data is Uint8List &&
              type == WebMessageTypeSpec.ARRAY_BUFFER),
    );
  }
}

///The type corresponding to the [WebMessage].
@ExchangeableEnum()
class WebMessageTypeSpec {
  // ignore: unused_field
  final int _value;

  const WebMessageTypeSpec._internal(this._value);

  ///Indicates the payload of WebMessageCompat is String.
  static const STRING = WebMessageTypeSpec._internal(0);

  ///Indicates the payload of WebMessageCompat is JavaScript ArrayBuffer.
  ///
  ///**NOTE**: available only if [WebViewFeature.WEB_MESSAGE_ARRAY_BUFFER] feature is supported.
  static const ARRAY_BUFFER = WebMessageTypeSpec._internal(1);
}

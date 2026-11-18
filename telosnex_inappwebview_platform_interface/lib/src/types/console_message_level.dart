import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'console_message_level.g.dart';

///Class representing the level of a console message.
@ExchangeableEnum()
class ConsoleMessageLevelSpec {
  // ignore: unused_field
  final int _value;
  const ConsoleMessageLevelSpec._internal(this._value);

  ///Console TIP level
  static const TIP = ConsoleMessageLevelSpec._internal(0);

  ///Console LOG level
  static const LOG = ConsoleMessageLevelSpec._internal(1);

  ///Console WARNING level
  static const WARNING = ConsoleMessageLevelSpec._internal(2);

  ///Console ERROR level
  static const ERROR = ConsoleMessageLevelSpec._internal(3);

  ///Console DEBUG level
  static const DEBUG = ConsoleMessageLevelSpec._internal(4);
}

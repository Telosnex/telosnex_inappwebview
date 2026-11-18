import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'font_hinting_style.g.dart';

///Font hinting style used for text rendering on Linux.
@ExchangeableEnum()
class FontHintingStyleSpec {
  // ignore: unused_field
  final int _value;
  const FontHintingStyleSpec._internal(this._value);

  ///No hinting. Text is rendered without any hinting.
  static const NONE = FontHintingStyleSpec._internal(0);

  ///Slight hinting. A minimal amount of hinting is applied.
  static const SLIGHT = FontHintingStyleSpec._internal(1);

  ///Medium hinting. A moderate amount of hinting is applied.
  static const MEDIUM = FontHintingStyleSpec._internal(2);

  ///Full hinting. Maximum hinting is applied for crispest text.
  static const FULL = FontHintingStyleSpec._internal(3);
}

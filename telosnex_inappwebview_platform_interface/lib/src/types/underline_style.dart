import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'underline_style.g.dart';

///Class that represents the constants for the underline style and strikethrough style attribute keys.
@ExchangeableEnum()
class UnderlineStyleSpec {
  // ignore: unused_field
  final int _value;
  const UnderlineStyleSpec._internal(this._value);

  ///Do not draw a line.
  static const STYLE_NONE = UnderlineStyleSpec._internal(0);

  ///Draw a single line.
  static const SINGLE = UnderlineStyleSpec._internal(1);

  ///Draw a thick line.
  static const THICK = UnderlineStyleSpec._internal(2);

  ///Draw a double line.
  static const DOUBLE = UnderlineStyleSpec._internal(9);

  ///Draw a line of dots.
  static const PATTERN_DOT = UnderlineStyleSpec._internal(256);

  ///Draw a line of dashes.
  static const PATTERN_DASH = UnderlineStyleSpec._internal(512);

  ///Draw a line of alternating dashes and dots.
  static const PATTERN_DASH_DOT = UnderlineStyleSpec._internal(768);

  ///Draw a line of alternating dashes and two dots.
  static const PATTERN_DASH_DOT_DOT = UnderlineStyleSpec._internal(1024);

  ///Draw the line only beneath or through words, not whitespace.
  static const BY_WORD = UnderlineStyleSpec._internal(32768);
}

///An iOS-specific Class that represents the constants for the underline style and strikethrough style attribute keys.
///Use [UnderlineStyle] instead.
@Deprecated("Use UnderlineStyle instead")
@ExchangeableEnum()
class IOSNSUnderlineStyleSpec {
  // ignore: unused_field
  final int _value;
  const IOSNSUnderlineStyleSpec._internal(this._value);

  ///Do not draw a line.
  static const STYLE_NONE = IOSNSUnderlineStyleSpec._internal(0);

  ///Draw a single line.
  static const SINGLE = IOSNSUnderlineStyleSpec._internal(1);

  ///Draw a thick line.
  static const THICK = IOSNSUnderlineStyleSpec._internal(2);

  ///Draw a double line.
  static const DOUBLE = IOSNSUnderlineStyleSpec._internal(9);

  ///Draw a line of dots.
  static const PATTERN_DOT = IOSNSUnderlineStyleSpec._internal(256);

  ///Draw a line of dashes.
  static const PATTERN_DASH = IOSNSUnderlineStyleSpec._internal(512);

  ///Draw a line of alternating dashes and dots.
  static const PATTERN_DASH_DOT = IOSNSUnderlineStyleSpec._internal(768);

  ///Draw a line of alternating dashes and two dots.
  static const PATTERN_DASH_DOT_DOT = IOSNSUnderlineStyleSpec._internal(1024);

  ///Draw the line only beneath or through words, not whitespace.
  static const BY_WORD = IOSNSUnderlineStyleSpec._internal(32768);
}

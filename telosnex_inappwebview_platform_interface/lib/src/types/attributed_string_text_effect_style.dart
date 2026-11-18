import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'attributed_string_text_effect_style.g.dart';

///Class that represents the supported proxy types.
@ExchangeableEnum()
class AttributedStringTextEffectStyleSpec {
  // ignore: unused_field
  final String _value;
  const AttributedStringTextEffectStyleSpec._internal(this._value);

  ///A graphical text effect that gives glyphs the appearance of letterpress printing, which involves pressing the type into the paper.
  static const LETTERPRESS_STYLE =
      AttributedStringTextEffectStyleSpec._internal("letterpressStyle");
}

///An iOS-specific Class that represents the supported proxy types.
///Use [AttributedStringTextEffectStyle] instead.
@Deprecated("Use AttributedStringTextEffectStyle instead")
@ExchangeableEnum()
class IOSNSAttributedStringTextEffectStyleSpec {
  // ignore: unused_field
  final String _value;
  const IOSNSAttributedStringTextEffectStyleSpec._internal(this._value);

  ///A graphical text effect that gives glyphs the appearance of letterpress printing, which involves pressing the type into the paper.
  static const LETTERPRESS_STYLE =
      IOSNSAttributedStringTextEffectStyleSpec._internal("letterpressStyle");
}

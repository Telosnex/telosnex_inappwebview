import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'favicon_image_format.g.dart';

///Constants that describe the favicon image format.
@ExchangeableEnum()
class FaviconImageFormatSpec {
  // ignore: unused_field
  final int _value;
  const FaviconImageFormatSpec._internal(this._value);

  ///PNG image format.
  static const PNG = FaviconImageFormatSpec._internal(0);

  ///JPEG image format.
  static const JPEG = FaviconImageFormatSpec._internal(1);
}

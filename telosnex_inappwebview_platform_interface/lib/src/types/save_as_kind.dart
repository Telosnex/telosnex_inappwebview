import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'save_as_kind.g.dart';

///Constants that describe the Save As kind.
@ExchangeableEnum()
class SaveAsKindSpec {
  // ignore: unused_field
  final int _value;
  const SaveAsKindSpec._internal(this._value);

  ///Default kind to save non-HTML content.
  static const DEFAULT = SaveAsKindSpec._internal(0);

  ///Save the page as HTML only.
  static const HTML_ONLY = SaveAsKindSpec._internal(1);

  ///Save the page as a single file (MHTML).
  static const SINGLE_FILE = SaveAsKindSpec._internal(2);

  ///Save the page with a resources directory.
  static const COMPLETE = SaveAsKindSpec._internal(3);
}

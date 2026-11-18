import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'pdf_toolbar_items.g.dart';

///Class used to customize the PDF toolbar items.
@ExchangeableEnum(bitwiseOrOperator: true)
class PdfToolbarItemsSpec {
  // ignore: unused_field
  final int _value;
  const PdfToolbarItemsSpec._internal(this._value);

  ///No item.
  static const NONE = PdfToolbarItemsSpec._internal(0);

  ///The save button.
  static const SAVE = PdfToolbarItemsSpec._internal(1);

  ///The print button.
  static const PRINT = PdfToolbarItemsSpec._internal(2);

  ///The save as button.
  static const SAVE_AS = PdfToolbarItemsSpec._internal(4);

  ///The zoom in button.
  static const ZOOM_IN = PdfToolbarItemsSpec._internal(8);

  ///The zoom out button.
  static const ZOOM_OUT = PdfToolbarItemsSpec._internal(16);

  ///The rotate button.
  static const ROTATE = PdfToolbarItemsSpec._internal(32);

  ///The fit page button.
  static const FIT_PAGE = PdfToolbarItemsSpec._internal(64);

  ///The page layout button.
  static const PAGE_LAYOUT = PdfToolbarItemsSpec._internal(128);

  ///The bookmarks button.
  static const BOOKMARKS = PdfToolbarItemsSpec._internal(256);

  ///The page select button.
  static const PAGE_SELECTOR = PdfToolbarItemsSpec._internal(512);

  ///The search button.
  static const SEARCH = PdfToolbarItemsSpec._internal(1024);

  ///The full screen button.
  static const FULL_SCREEN = PdfToolbarItemsSpec._internal(2048);

  ///The more settings button.
  static const MORE_SETTINGS = PdfToolbarItemsSpec._internal(4096);
}

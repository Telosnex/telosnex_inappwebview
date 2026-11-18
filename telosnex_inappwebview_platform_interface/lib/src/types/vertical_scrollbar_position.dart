import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'vertical_scrollbar_position.g.dart';

///Class used to configure the position of the vertical scroll bar.
@ExchangeableEnum()
class VerticalScrollbarPositionSpec {
  // ignore: unused_field
  final int _value;
  const VerticalScrollbarPositionSpec._internal(this._value);

  ///Position the scroll bar at the default position as determined by the system.
  static const SCROLLBAR_POSITION_DEFAULT =
      VerticalScrollbarPositionSpec._internal(0);

  ///Position the scroll bar along the left edge.
  static const SCROLLBAR_POSITION_LEFT =
      VerticalScrollbarPositionSpec._internal(1);

  ///Position the scroll bar along the right edge.
  static const SCROLLBAR_POSITION_RIGHT =
      VerticalScrollbarPositionSpec._internal(2);
}

///An Android-specific class used to configure the position of the vertical scroll bar.
///Use [VerticalScrollbarPosition] instead.
@Deprecated("Use VerticalScrollbarPosition instead")
@ExchangeableEnum()
class AndroidVerticalScrollbarPositionSpec {
  // ignore: unused_field
  final int _value;
  const AndroidVerticalScrollbarPositionSpec._internal(this._value);

  ///Position the scroll bar at the default position as determined by the system.
  static const SCROLLBAR_POSITION_DEFAULT =
      AndroidVerticalScrollbarPositionSpec._internal(0);

  ///Position the scroll bar along the left edge.
  static const SCROLLBAR_POSITION_LEFT =
      AndroidVerticalScrollbarPositionSpec._internal(1);

  ///Position the scroll bar along the right edge.
  static const SCROLLBAR_POSITION_RIGHT =
      AndroidVerticalScrollbarPositionSpec._internal(2);
}

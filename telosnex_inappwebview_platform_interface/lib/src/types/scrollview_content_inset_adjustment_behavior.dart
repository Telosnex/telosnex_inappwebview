import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'scrollview_content_inset_adjustment_behavior.g.dart';

///Class used to configure how safe area insets are added to the adjusted content inset.
@ExchangeableEnum()
class ScrollViewContentInsetAdjustmentBehaviorSpec {
  // ignore: unused_field
  final int _value;
  const ScrollViewContentInsetAdjustmentBehaviorSpec._internal(this._value);

  ///Automatically adjust the scroll view insets.
  static const AUTOMATIC =
      ScrollViewContentInsetAdjustmentBehaviorSpec._internal(0);

  ///Adjust the insets only in the scrollable directions.
  static const SCROLLABLE_AXES =
      ScrollViewContentInsetAdjustmentBehaviorSpec._internal(1);

  ///Do not adjust the scroll view insets.
  static const NEVER = ScrollViewContentInsetAdjustmentBehaviorSpec._internal(
    2,
  );

  ///Always include the safe area insets in the content adjustment.
  static const ALWAYS = ScrollViewContentInsetAdjustmentBehaviorSpec._internal(
    3,
  );
}

///An iOS-specific class used to configure how safe area insets are added to the adjusted content inset.
///
///**NOTE**: available on iOS 11.0+.
///
///Use [ScrollViewContentInsetAdjustmentBehavior] instead.
@Deprecated("Use ScrollViewContentInsetAdjustmentBehavior instead")
@ExchangeableEnum()
class IOSUIScrollViewContentInsetAdjustmentBehaviorSpec {
  // ignore: unused_field
  final int _value;
  const IOSUIScrollViewContentInsetAdjustmentBehaviorSpec._internal(
    this._value,
  );

  ///Automatically adjust the scroll view insets.
  static const AUTOMATIC =
      IOSUIScrollViewContentInsetAdjustmentBehaviorSpec._internal(0);

  ///Adjust the insets only in the scrollable directions.
  static const SCROLLABLE_AXES =
      IOSUIScrollViewContentInsetAdjustmentBehaviorSpec._internal(1);

  ///Do not adjust the scroll view insets.
  static const NEVER =
      IOSUIScrollViewContentInsetAdjustmentBehaviorSpec._internal(2);

  ///Always include the safe area insets in the content adjustment.
  static const ALWAYS =
      IOSUIScrollViewContentInsetAdjustmentBehaviorSpec._internal(3);
}

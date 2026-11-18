import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'scrollview_deceleration_rate.g.dart';

///Class that represents a floating-point value that determines the rate of deceleration after the user lifts their finger.
@ExchangeableEnum()
class ScrollViewDecelerationRateSpec {
  // ignore: unused_field
  final String _value;
  const ScrollViewDecelerationRateSpec._internal(this._value);

  ///The default deceleration rate for a scroll view: `0.998`.
  static const NORMAL = ScrollViewDecelerationRateSpec._internal("NORMAL");

  ///A fast deceleration rate for a scroll view: `0.99`.
  static const FAST = ScrollViewDecelerationRateSpec._internal("FAST");
}

///Class that represents a floating-point value that determines the rate of deceleration after the user lifts their finger.
///Use [ScrollViewDecelerationRate] instead.
@Deprecated("Use ScrollViewDecelerationRate instead")
@ExchangeableEnum()
class IOSUIScrollViewDecelerationRateSpec {
  // ignore: unused_field
  final String _value;
  const IOSUIScrollViewDecelerationRateSpec._internal(this._value);

  ///The default deceleration rate for a scroll view: `0.998`.
  static const NORMAL = IOSUIScrollViewDecelerationRateSpec._internal("NORMAL");

  ///A fast deceleration rate for a scroll view: `0.99`.
  static const FAST = IOSUIScrollViewDecelerationRateSpec._internal("FAST");
}

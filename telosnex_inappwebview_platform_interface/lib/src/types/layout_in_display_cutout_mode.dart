import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'layout_in_display_cutout_mode.g.dart';

///Class representing the share state that should be applied to the custom tab.
@ExchangeableEnum()
class LayoutInDisplayCutoutModeSpec {
  // ignore: unused_field
  final int _value;
  const LayoutInDisplayCutoutModeSpec._internal(this._value);

  ///With this default setting, content renders into the cutout area when displayed in portrait mode, but content is letterboxed when displayed in landscape mode.
  ///
  ///**NOTE**: available on Android 28+.
  static const DEFAULT = LayoutInDisplayCutoutModeSpec._internal(0);

  ///Content renders into the cutout area in both portrait and landscape modes.
  ///
  ///**NOTE**: available on Android 28+.
  static const SHORT_EDGES = LayoutInDisplayCutoutModeSpec._internal(1);

  ///Content never renders into the cutout area.
  ///
  ///**NOTE**: available on Android 28+.
  static const NEVER = LayoutInDisplayCutoutModeSpec._internal(2);

  ///The window is always allowed to extend into the DisplayCutout areas on the all edges of the screen.
  ///
  ///**NOTE**: available on Android 30+.
  static const ALWAYS = LayoutInDisplayCutoutModeSpec._internal(3);

  @ExchangeableObjectMethod(ignore: true)
  static LayoutInDisplayCutoutModeSpec? fromNativeValue(int? value) {
    return null;
  }
}

///Android-specific class representing the share state that should be applied to the custom tab.
///
///**NOTE**: available on Android 28+.
///
///Use [LayoutInDisplayCutoutMode] instead.
@Deprecated("Use LayoutInDisplayCutoutMode instead")
@ExchangeableEnum()
class AndroidLayoutInDisplayCutoutModeSpec {
  // ignore: unused_field
  final int _value;
  const AndroidLayoutInDisplayCutoutModeSpec._internal(this._value);

  ///With this default setting, content renders into the cutout area when displayed in portrait mode, but content is letterboxed when displayed in landscape mode.
  ///
  ///**NOTE**: available on Android 28+.
  static const DEFAULT = AndroidLayoutInDisplayCutoutModeSpec._internal(0);

  ///Content renders into the cutout area in both portrait and landscape modes.
  ///
  ///**NOTE**: available on Android 28+.
  static const SHORT_EDGES = AndroidLayoutInDisplayCutoutModeSpec._internal(1);

  ///Content never renders into the cutout area.
  ///
  ///**NOTE**: available on Android 28+.
  static const NEVER = AndroidLayoutInDisplayCutoutModeSpec._internal(2);

  ///The window is always allowed to extend into the DisplayCutout areas on the all edges of the screen.
  ///
  ///**NOTE**: available on Android 30+.
  static const ALWAYS = AndroidLayoutInDisplayCutoutModeSpec._internal(3);

  @ExchangeableObjectMethod(ignore: true)
  int toNativeValue() => 0;
}

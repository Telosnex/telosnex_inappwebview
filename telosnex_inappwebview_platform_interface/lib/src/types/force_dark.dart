import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'force_dark.g.dart';

///Class used to indicate the force dark mode.
@ExchangeableEnum()
class ForceDarkSpec {
  // ignore: unused_field
  final int _value;
  const ForceDarkSpec._internal(this._value);

  ///Disable force dark, irrespective of the force dark mode of the WebView parent.
  ///In this mode, WebView content will always be rendered as-is, regardless of whether native views are being automatically darkened.
  static const OFF = ForceDarkSpec._internal(0);

  ///Enable force dark dependent on the state of the WebView parent view.
  static const AUTO = ForceDarkSpec._internal(1);

  ///Unconditionally enable force dark. In this mode WebView content will always be rendered so as to emulate a dark theme.
  static const ON = ForceDarkSpec._internal(2);
}

///An Android-specific class used to indicate the force dark mode.
///
///**NOTE**: available on Android 29+.
///
///Use [ForceDark] instead.
@Deprecated("Use ForceDark instead")
@ExchangeableEnum()
class AndroidForceDarkSpec {
  // ignore: unused_field
  final int _value;
  const AndroidForceDarkSpec._internal(this._value);

  ///Disable force dark, irrespective of the force dark mode of the WebView parent.
  ///In this mode, WebView content will always be rendered as-is, regardless of whether native views are being automatically darkened.
  static const FORCE_DARK_OFF = AndroidForceDarkSpec._internal(0);

  ///Enable force dark dependent on the state of the WebView parent view.
  static const FORCE_DARK_AUTO = AndroidForceDarkSpec._internal(1);

  ///Unconditionally enable force dark. In this mode WebView content will always be rendered so as to emulate a dark theme.
  static const FORCE_DARK_ON = AndroidForceDarkSpec._internal(2);
}

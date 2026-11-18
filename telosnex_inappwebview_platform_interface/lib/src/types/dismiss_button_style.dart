import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'dismiss_button_style.g.dart';

///Class used to set the custom style for the dismiss button.
@ExchangeableEnum()
class DismissButtonStyleSpec {
  // ignore: unused_field
  final int _value;
  const DismissButtonStyleSpec._internal(this._value);

  ///Makes the button title the localized string "Done".
  static const DONE = DismissButtonStyleSpec._internal(0);

  ///Makes the button title the localized string "Close".
  static const CLOSE = DismissButtonStyleSpec._internal(1);

  ///Makes the button title the localized string "Cancel".
  static const CANCEL = DismissButtonStyleSpec._internal(2);
}

///An iOS-specific class used to set the custom style for the dismiss button.
///
///**NOTE**: available on iOS 11.0+.
///
///Use [DismissButtonStyle] instead.
@Deprecated("Use DismissButtonStyle instead")
@ExchangeableEnum()
class IOSSafariDismissButtonStyleSpec {
  // ignore: unused_field
  final int _value;
  const IOSSafariDismissButtonStyleSpec._internal(this._value);

  ///Makes the button title the localized string "Done".
  static const DONE = IOSSafariDismissButtonStyleSpec._internal(0);

  ///Makes the button title the localized string "Close".
  static const CLOSE = IOSSafariDismissButtonStyleSpec._internal(1);

  ///Makes the button title the localized string "Cancel".
  static const CANCEL = IOSSafariDismissButtonStyleSpec._internal(2);
}

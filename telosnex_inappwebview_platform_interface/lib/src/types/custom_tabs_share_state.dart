import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'custom_tabs_share_state.g.dart';

///Class representing the share state that should be applied to the custom tab.
@ExchangeableEnum()
class CustomTabsShareStateSpec {
  // ignore: unused_field
  final int _value;
  const CustomTabsShareStateSpec._internal(this._value);

  ///Applies the default share settings depending on the browser.
  static const SHARE_STATE_DEFAULT = CustomTabsShareStateSpec._internal(0);

  ///Shows a share option in the tab.
  static const SHARE_STATE_ON = CustomTabsShareStateSpec._internal(1);

  ///Explicitly does not show a share option in the tab.
  static const SHARE_STATE_OFF = CustomTabsShareStateSpec._internal(2);
}

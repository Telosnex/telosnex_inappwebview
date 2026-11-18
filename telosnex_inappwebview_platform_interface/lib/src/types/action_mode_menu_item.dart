import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'action_mode_menu_item.g.dart';

///Class used to disable the action mode menu items.
@ExchangeableEnum(bitwiseOrOperator: true)
class ActionModeMenuItemSpec {
  // ignore: unused_field
  final int _value;
  const ActionModeMenuItemSpec._internal(this._value);

  ///No menu items should be disabled.
  static const MENU_ITEM_NONE = ActionModeMenuItemSpec._internal(0);

  ///Disable menu item "Share".
  static const MENU_ITEM_SHARE = ActionModeMenuItemSpec._internal(1);

  ///Disable menu item "Web Search".
  static const MENU_ITEM_WEB_SEARCH = ActionModeMenuItemSpec._internal(2);

  ///Disable all the action mode menu items for text processing.
  static const MENU_ITEM_PROCESS_TEXT = ActionModeMenuItemSpec._internal(4);
}

///An Android-specific class used to disable the action mode menu items.
///
///**NOTE**: available on Android 24+.
///
///Use [ActionModeMenuItem] instead.
@Deprecated("Use ActionModeMenuItem instead")
@ExchangeableEnum(bitwiseOrOperator: true)
class AndroidActionModeMenuItemSpec {
  // ignore: unused_field
  final int _value;
  const AndroidActionModeMenuItemSpec._internal(this._value);

  ///No menu items should be disabled.
  static const MENU_ITEM_NONE = AndroidActionModeMenuItemSpec._internal(0);

  ///Disable menu item "Share".
  static const MENU_ITEM_SHARE = AndroidActionModeMenuItemSpec._internal(1);

  ///Disable menu item "Web Search".
  static const MENU_ITEM_WEB_SEARCH = AndroidActionModeMenuItemSpec._internal(
    2,
  );

  ///Disable all the action mode menu items for text processing.
  static const MENU_ITEM_PROCESS_TEXT = AndroidActionModeMenuItemSpec._internal(
    4,
  );
}

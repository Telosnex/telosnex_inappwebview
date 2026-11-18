import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'window_type.g.dart';

///Class that represents how a browser window should be added to the main window.
@ExchangeableEnum()
class WindowTypeSpec {
  // ignore: unused_field
  final String _value;

  const WindowTypeSpec._internal(this._value);

  ///Adds the new browser window as a separate new window from the main window.
  @EnumSupportedPlatforms(
    platforms: [
      EnumMacOSPlatform(value: 'WINDOW'),
      EnumWindowsPlatform(value: 'WINDOW'),
    ],
  )
  static const WINDOW = WindowTypeSpec._internal('WINDOW');

  ///Adds the new browser window as a child window of the main window.
  @EnumSupportedPlatforms(
    platforms: [
      EnumMacOSPlatform(value: 'CHILD'),
      EnumWindowsPlatform(value: 'CHILD'),
    ],
  )
  static const CHILD = WindowTypeSpec._internal('CHILD');

  ///Adds the new browser window as a new tab in a tabbed window of the main window.
  @EnumSupportedPlatforms(
    platforms: [EnumMacOSPlatform(value: 'TABBED', available: "10.12+")],
  )
  static const TABBED = WindowTypeSpec._internal('TABBED');
}

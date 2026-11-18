import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'window_titlebar_separator_style.g.dart';

///Class that represents the type of separator that the app displays between the title bar and content of a browser window.
@ExchangeableEnum()
class WindowTitlebarSeparatorStyleSpec {
  // ignore: unused_field
  final int _value;
  // ignore: unused_field
  final int? _nativeValue = null;
  const WindowTitlebarSeparatorStyleSpec._internal(this._value);

  ///A style indicating that the system determines the type of separator.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 0)])
  static const AUTOMATIC = WindowTitlebarSeparatorStyleSpec._internal(0);

  ///A style indicating that the title bar separator is a line.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 1)])
  static const NONE = WindowTitlebarSeparatorStyleSpec._internal(1);

  ///A style indicating that there’s no title bar separator.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 2)])
  static const LINE = WindowTitlebarSeparatorStyleSpec._internal(2);

  ///A style indicating that the title bar separator is a shadow.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 3)])
  static const SHADOW = WindowTitlebarSeparatorStyleSpec._internal(3);
}

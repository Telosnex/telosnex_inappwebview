import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'browser_process_kind.g.dart';

///Indicates the process type used in the [BrowserProcessInfo] interface.
@ExchangeableEnum(bitwiseOrOperator: true)
class BrowserProcessKindSpec {
  // ignore: unused_field
  final int _value;
  const BrowserProcessKindSpec._internal(this._value);

  ///Indicates the browser process kind.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 0)])
  static const BROWSER = BrowserProcessKindSpec._internal(0);

  ///Indicates the render process kind.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 1)])
  static const RENDERER = BrowserProcessKindSpec._internal(1);

  ///Indicates the utility process kind.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 2)])
  static const UTILITY = BrowserProcessKindSpec._internal(2);

  ///Indicates the sandbox helper process kind.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 3)])
  static const SANDBOX_HELPER = BrowserProcessKindSpec._internal(3);

  ///Indicates the GPU process kind.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 4)])
  static const GPU = BrowserProcessKindSpec._internal(4);

  ///Indicates the PPAPI plugin process kind.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 5)])
  static const PPAPI_PLUGIN = BrowserProcessKindSpec._internal(5);

  ///Indicates the PPAPI plugin broker process kind.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 6)])
  static const PPAPI_BROKER = BrowserProcessKindSpec._internal(6);
}

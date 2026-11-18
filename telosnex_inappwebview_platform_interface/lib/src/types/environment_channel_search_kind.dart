import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview_environment/platform_webview_environment.dart';

part 'environment_channel_search_kind.g.dart';

///The channel search kind determines the order that release
///channels are searched for during [PlatformWebViewEnvironment] creation.
@ExchangeableEnum()
class EnvironmentChannelSearchKindSpec {
  // ignore: unused_field
  final int _value;
  const EnvironmentChannelSearchKindSpec._internal(this._value);

  ///Search for a release channel from most to least stable: WebView2 Runtime -> Beta -> Dev -> Canary. This is the default behavior.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 0)])
  static const MOST_STABLE = EnvironmentChannelSearchKindSpec._internal(0);

  ///Search for a release channel from least to most stable: Canary -> Dev -> Beta -> WebView2 Runtime.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 1)])
  static const LEAST_STABLE = EnvironmentChannelSearchKindSpec._internal(1);
}

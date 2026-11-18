import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'http_auth_response.dart';

part 'http_auth_response_action.g.dart';

///Class used by [HttpAuthResponse] class.
@ExchangeableEnum()
class HttpAuthResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const HttpAuthResponseActionSpec._internal(this._value);

  ///Instructs the WebView to cancel the authentication request.
  @EnumSupportedPlatforms(
    platforms: [
      EnumAndroidPlatform(),
      EnumIOSPlatform(),
      EnumMacOSPlatform(),
      EnumWindowsPlatform(),
      EnumLinuxPlatform(value: 0),
    ],
  )
  static const CANCEL = HttpAuthResponseActionSpec._internal(0);

  ///Instructs the WebView to proceed with the authentication with the given credentials.
  @EnumSupportedPlatforms(
    platforms: [
      EnumAndroidPlatform(),
      EnumIOSPlatform(),
      EnumMacOSPlatform(),
      EnumWindowsPlatform(),
      EnumLinuxPlatform(value: 1),
    ],
  )
  static const PROCEED = HttpAuthResponseActionSpec._internal(1);

  ///Uses the credentials stored for the current host.
  @EnumSupportedPlatforms(
    platforms: [
      EnumAndroidPlatform(),
      EnumIOSPlatform(),
      EnumMacOSPlatform(),
      EnumLinuxPlatform(value: 2),
    ],
  )
  static const USE_SAVED_HTTP_AUTH_CREDENTIALS =
      HttpAuthResponseActionSpec._internal(2);
}

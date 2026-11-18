import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import '../in_app_webview/platform_webview.dart';
part 'navigation_response_action.g.dart';

///Class that is used by [PlatformWebViewCreationParams.onNavigationResponse] event.
///It represents the policy to pass back to the decision handler.
@ExchangeableEnum()
class NavigationResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const NavigationResponseActionSpec._internal(this._value);

  ///Cancel the navigation.
  static const CANCEL = NavigationResponseActionSpec._internal(0);

  ///Allow the navigation to continue.
  static const ALLOW = NavigationResponseActionSpec._internal(1);

  ///Turn the navigation into a download.
  ///
  ///**NOTE**: available only on iOS 14.5+. It will fallback to [CANCEL].
  static const DOWNLOAD = NavigationResponseActionSpec._internal(2);
}

///Class that is used by [PlatformWebViewCreationParams.onNavigationResponse] event.
///It represents the policy to pass back to the decision handler.
///Use [NavigationResponseAction] instead.
@Deprecated("Use NavigationResponseAction instead")
@ExchangeableEnum()
class IOSNavigationResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const IOSNavigationResponseActionSpec._internal(this._value);

  ///Cancel the navigation.
  static const CANCEL = IOSNavigationResponseActionSpec._internal(0);

  ///Allow the navigation to continue.
  static const ALLOW = IOSNavigationResponseActionSpec._internal(1);
}

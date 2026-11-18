import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import '../in_app_webview/platform_webview.dart';
part 'navigation_action_policy.g.dart';

///Class that is used by [PlatformWebViewCreationParams.shouldOverrideUrlLoading] event.
///It represents the policy to pass back to the decision handler.
@ExchangeableEnum()
class NavigationActionPolicySpec {
  // ignore: unused_field
  final int _value;
  const NavigationActionPolicySpec._internal(this._value);

  ///Cancel the navigation.
  static const CANCEL = NavigationActionPolicySpec._internal(0);

  ///Allow the navigation to continue.
  static const ALLOW = NavigationActionPolicySpec._internal(1);

  ///Turn the navigation into a download.
  ///
  ///**NOTE**: available only on iOS 14.5+. It will fallback to [CANCEL].
  static const DOWNLOAD = NavigationActionPolicySpec._internal(2);
}

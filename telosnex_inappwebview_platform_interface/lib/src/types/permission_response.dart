import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../in_app_webview/platform_webview.dart';
import 'permission_resource_type.dart';
import 'permission_response_action.dart';
import 'enum_method.dart';

part 'permission_response.g.dart';

///Class that represents the response used by the [PlatformWebViewCreationParams.onPermissionRequest] event.
@ExchangeableObject()
class PermissionResponseSpec {
  ///Resources granted to be accessed by origin.
  ///
  ///**NOTE for iOS, macOS and Windows**: not used. The [action] taken is based on the [PermissionRequest.resources].
  List<PermissionResourceTypeSpec> resources;

  ///Indicate the [PermissionResponseAction] to take in response of a permission request.
  PermissionResponseActionSpec? action;

  PermissionResponseSpec({
    this.resources = const [],
    this.action = PermissionResponseActionSpec.DENY,
  });
}

///Class that represents the response used by the [PlatformWebViewCreationParams.androidOnPermissionRequest] event.
///Use [PermissionResponse] instead.
@Deprecated("Use PermissionResponse instead")
@ExchangeableObject()
class PermissionRequestResponseSpec {
  ///Resources granted to be accessed by origin.
  List<String> resources;

  ///Indicate the [PermissionRequestResponseAction] to take in response of a permission request.
  PermissionRequestResponseActionSpec? action;

  PermissionRequestResponseSpec({
    this.resources = const [],
    this.action = PermissionRequestResponseActionSpec.DENY,
  });
}

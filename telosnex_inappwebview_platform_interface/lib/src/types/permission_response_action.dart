import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'permission_response.dart';

part 'permission_response_action.g.dart';

///Class used by [PermissionResponse] class.
@ExchangeableEnum()
class PermissionResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const PermissionResponseActionSpec._internal(this._value);

  ///Denies the request.
  static const DENY = PermissionResponseActionSpec._internal(0);

  ///Grants origin the permission to access the given resources.
  static const GRANT = PermissionResponseActionSpec._internal(1);

  ///Prompt the user for permission for the requested resource.
  static const PROMPT = PermissionResponseActionSpec._internal(2);
}

///Class used by [PermissionRequestResponse] class.
///Use [PermissionResponseAction] instead.
@Deprecated("Use PermissionResponseAction instead")
@ExchangeableEnum()
class PermissionRequestResponseActionSpec {
  // ignore: unused_field
  final int _value;
  const PermissionRequestResponseActionSpec._internal(this._value);

  ///Denies the request.
  static const DENY = PermissionRequestResponseActionSpec._internal(0);

  ///Grants origin the permission to access the given resources.
  static const GRANT = PermissionRequestResponseActionSpec._internal(1);
}

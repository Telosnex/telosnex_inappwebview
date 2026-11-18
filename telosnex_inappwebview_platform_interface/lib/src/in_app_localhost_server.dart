import 'package:flutter/foundation.dart';

import 'platform_in_app_localhost_server.dart';

export 'in_app_localhost_server_stub.dart'
    if (dart.library.io) 'in_app_localhost_server_io.dart';

/// Object specifying creation parameters for creating a [DefaultInAppLocalhostServer].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [PlatformInAppLocalhostServerCreationParams] for
/// more information.
@immutable
class DefaultInAppLocalhostServerCreationParams
    extends PlatformInAppLocalhostServerCreationParams {
  /// Creates a new [DefaultInAppLocalhostServerCreationParams] instance.
  const DefaultInAppLocalhostServerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    PlatformInAppLocalhostServerCreationParams params,
  ) : super();

  /// Creates a [DefaultInAppLocalhostServerCreationParams] instance based on [PlatformInAppLocalhostServerCreationParams].
  factory DefaultInAppLocalhostServerCreationParams.fromPlatformInAppLocalhostServerCreationParams(
    PlatformInAppLocalhostServerCreationParams params,
  ) {
    return DefaultInAppLocalhostServerCreationParams(params);
  }
}

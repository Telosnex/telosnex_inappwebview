import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:telosnex_inappwebview_platform_interface/telosnex_inappwebview_platform_interface.dart';

///{@macro telosnex_inappwebview_platform_interface.PlatformProxyController}
///
///{@macro telosnex_inappwebview_platform_interface.PlatformProxyController.supported_platforms}
class ProxyController {
  ///{@macro telosnex_inappwebview_platform_interface.PlatformProxyController}
  ProxyController()
    : this.fromPlatformCreationParams(
        const PlatformProxyControllerCreationParams(),
      );

  /// Constructs a [ProxyController] from creation params for a specific
  /// platform.
  ProxyController.fromPlatformCreationParams(
    PlatformProxyControllerCreationParams params,
  ) : this.fromPlatform(PlatformProxyController(params));

  /// Constructs a [ProxyController] from a specific platform
  /// implementation.
  ProxyController.fromPlatform(this.platform);

  /// Implementation of [PlatformProxyController] for the current platform.
  final PlatformProxyController platform;

  static ProxyController? _instance;

  ///Gets the [ProxyController] shared instance.
  static ProxyController instance() {
    if (_instance == null) {
      _instance = ProxyController();
    }
    return _instance!;
  }

  ///{@macro telosnex_inappwebview_platform_interface.PlatformProxyController.setProxyOverride}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformProxyController.setProxyOverride.supported_platforms}
  Future<void> setProxyOverride({required ProxySettings settings}) =>
      platform.setProxyOverride(settings: settings);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformProxyController.clearProxyOverride}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformProxyController.clearProxyOverride.supported_platforms}
  Future<void> clearProxyOverride() => platform.clearProxyOverride();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformProxyControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformProxyController.static().isClassSupported(platform: platform);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformProxyController.isMethodSupported}
  static bool isMethodSupported(
    PlatformProxyControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformProxyController.static().isMethodSupported(
    method,
    platform: platform,
  );
}

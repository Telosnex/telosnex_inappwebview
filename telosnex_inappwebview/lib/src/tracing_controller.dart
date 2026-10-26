import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:telosnex_inappwebview_platform_interface/telosnex_inappwebview_platform_interface.dart';

///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController}
///
///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController.supported_platforms}
class TracingController {
  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController}
  TracingController()
    : this.fromPlatformCreationParams(
        const PlatformTracingControllerCreationParams(),
      );

  /// Constructs a [TracingController] from creation params for a specific
  /// platform.
  TracingController.fromPlatformCreationParams(
    PlatformTracingControllerCreationParams params,
  ) : this.fromPlatform(PlatformTracingController(params));

  /// Constructs a [TracingController] from a specific platform
  /// implementation.
  TracingController.fromPlatform(this.platform);

  /// Implementation of [PlatformTracingController] for the current platform.
  final PlatformTracingController platform;

  static TracingController? _instance;

  ///Gets the [TracingController] shared instance.
  static TracingController instance() {
    if (_instance == null) {
      _instance = TracingController();
    }
    return _instance!;
  }

  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController.start}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController.start.supported_platforms}
  Future<void> start({required TracingSettings settings}) =>
      platform.start(settings: settings);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController.stop}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController.stop.supported_platforms}
  Future<bool> stop({String? filePath}) => platform.stop(filePath: filePath);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController.isTracing}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController.isTracing.supported_platforms}
  Future<bool> isTracing() => platform.isTracing();

  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformTracingController.static().isClassSupported(platform: platform);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformTracingController.isMethodSupported}
  static bool isMethodSupported(
    PlatformTracingControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformTracingController.static().isMethodSupported(
    method,
    platform: platform,
  );
}

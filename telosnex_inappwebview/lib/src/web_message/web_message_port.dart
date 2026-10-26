import 'package:telosnex_inappwebview_platform_interface/telosnex_inappwebview_platform_interface.dart';

///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort}
///
///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort.supported_platforms}
class WebMessagePort implements IWebMessagePort {
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort}
  WebMessagePort({required int index})
    : this.fromPlatformCreationParams(
        params: PlatformWebMessagePortCreationParams(index: index),
      );

  /// Constructs a [WebMessagePort].
  ///
  /// See [WebMessagePort.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebMessagePort.fromPlatformCreationParams({
    required PlatformWebMessagePortCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebMessagePort(params));

  /// Constructs a [WebMessagePort] from a specific platform implementation.
  WebMessagePort.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebMessagePort] for the current platform.
  final PlatformWebMessagePort platform;

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort.setWebMessageCallback}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort.setWebMessageCallback.supported_platforms}
  Future<void> setWebMessageCallback(WebMessageCallback? onMessage) =>
      platform.setWebMessageCallback(onMessage);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort.postMessage}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort.postMessage.supported_platforms}
  Future<void> postMessage(WebMessage message) => platform.postMessage(message);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort.close}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessagePort.close.supported_platforms}
  Future<void> close() => platform.close();

  Map<String, dynamic> toMap({EnumMethod? enumMethod}) =>
      platform.toMap(enumMethod: enumMethod);

  Map<String, dynamic> toJson() => platform.toJson();

  @override
  String toString() => platform.toString();
}

import 'package:flutter/foundation.dart';
import 'package:telosnex_inappwebview_platform_interface/telosnex_inappwebview_platform_interface.dart';

///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener}
///
///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.supported_platforms}
class WebMessageListener {
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener}
  WebMessageListener({
    required String jsObjectName,
    Set<String>? allowedOriginRules,
    OnPostMessageCallback? onPostMessage,
  }) : this.fromPlatformCreationParams(
         params: PlatformWebMessageListenerCreationParams(
           jsObjectName: jsObjectName,
           allowedOriginRules: allowedOriginRules,
           onPostMessage: onPostMessage,
         ),
       );

  /// Constructs a [WebMessageListener].
  ///
  /// See [WebMessageListener.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebMessageListener.fromPlatformCreationParams({
    required PlatformWebMessageListenerCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebMessageListener(params));

  /// Constructs a [WebMessageListener] from a specific platform implementation.
  WebMessageListener.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebMessageListener] for the current platform.
  final PlatformWebMessageListener platform;

  /// Provide static access.
  static WebMessageListener static() {
    return WebMessageListener.fromPlatform(
      platform: PlatformWebMessageListener.static(),
    );
  }

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListenerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformWebMessageListener.static().isClassSupported(platform: platform);

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.isPropertySupported}
  static bool isPropertySupported(
    PlatformWebMessageListenerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => PlatformWebMessageListener.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.isMethodSupported}
  static bool isMethodSupported(
    PlatformWebMessageListenerMethod method, {
    TargetPlatform? platform,
  }) => PlatformWebMessageListener.static().isMethodSupported(
    method,
    platform: platform,
  );

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.jsObjectName}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.jsObjectName.supported_platforms}
  String get jsObjectName => platform.jsObjectName;

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.allowedOriginRules}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.allowedOriginRules.supported_platforms}
  Set<String>? get allowedOriginRules => platform.allowedOriginRules;

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.onPostMessage}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.onPostMessage.supported_platforms}
  OnPostMessageCallback? get onPostMessage => platform.onPostMessage;

  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.dispose}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformWebMessageListener.dispose.supported_platforms}
  void dispose() => platform.dispose();

  Map<String, dynamic> toMap() => platform.toMap();

  Map<String, dynamic> toJson() => platform.toJson();

  @override
  String toString() => platform.toString();
}

///{@macro telosnex_inappwebview_platform_interface.PlatformJavaScriptReplyProxy}
///
///{@macro telosnex_inappwebview_platform_interface.PlatformJavaScriptReplyProxy.supported_platforms}
class JavaScriptReplyProxy {
  ///{@macro telosnex_inappwebview_platform_interface.PlatformJavaScriptReplyProxy}
  JavaScriptReplyProxy({required PlatformWebMessageListener webMessageListener})
    : this.fromPlatformCreationParams(
        params: PlatformJavaScriptReplyProxyCreationParams(
          webMessageListener: webMessageListener,
        ),
      );

  /// Constructs a [JavaScriptReplyProxy].
  ///
  /// See [JavaScriptReplyProxy.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  JavaScriptReplyProxy.fromPlatformCreationParams({
    required PlatformJavaScriptReplyProxyCreationParams params,
  }) : this.fromPlatform(platform: PlatformJavaScriptReplyProxy(params));

  /// Constructs a [JavaScriptReplyProxy] from a specific platform implementation.
  JavaScriptReplyProxy.fromPlatform({required this.platform});

  /// Implementation of [PlatformJavaScriptReplyProxy] for the current platform.
  final PlatformJavaScriptReplyProxy platform;

  ///{@macro telosnex_inappwebview_platform_interface.PlatformJavaScriptReplyProxy.postMessage}
  ///
  ///{@macro telosnex_inappwebview_platform_interface.PlatformJavaScriptReplyProxy.postMessage.supported_platforms}
  Future<void> postMessage(WebMessage message) => platform.postMessage(message);

  @override
  String toString() {
    return 'JavaScriptReplyProxy{}';
  }
}

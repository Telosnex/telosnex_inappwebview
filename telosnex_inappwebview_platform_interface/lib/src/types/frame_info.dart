import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'url_request.dart';
import 'security_origin.dart';
import 'frame_kind.dart';
import 'enum_method.dart';

part 'frame_info.g.dart';

///An object that contains information about a frame on a webpage.
@ExchangeableObject()
class FrameInfoSpec {
  ///A Boolean value indicating whether the frame is the web site's main frame or a subframe.
  @SupportedPlatforms(
    platforms: [IOSPlatform(), MacOSPlatform(), WindowsPlatform()],
  )
  bool isMainFrame;

  ///The frame’s current request.
  @SupportedPlatforms(
    platforms: [IOSPlatform(), MacOSPlatform(), WindowsPlatform()],
  )
  URLRequestSpec? request;

  ///The frame’s security origin.
  @SupportedPlatforms(
    platforms: [IOSPlatform(), MacOSPlatform(), WindowsPlatform()],
  )
  SecurityOriginSpec? securityOrigin;

  ///Gets the name attribute of the frame, as in <iframe name="frame-name">...</iframe>.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  String? name;

  ///The unique identifier of the frame associated with the current [FrameInfo].
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  int? frameId;

  ///The kind of the frame.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  FrameKindSpec? kind;

  FrameInfoSpec({
    required this.isMainFrame,
    required this.request,
    this.securityOrigin,
    this.name,
    this.frameId,
    this.kind,
  });
}

///An object that contains information about a frame on a webpage.
///
///**NOTE**: available only on iOS.
///
///Use [FrameInfo] instead.
@Deprecated("Use FrameInfo instead")
@ExchangeableObject()
class IOSWKFrameInfoSpec {
  ///A Boolean value indicating whether the frame is the web site's main frame or a subframe.
  bool isMainFrame;

  ///The frame’s current request.
  URLRequestSpec? request;

  ///The frame’s security origin.
  IOSWKSecurityOriginSpec? securityOrigin;

  IOSWKFrameInfoSpec({
    required this.isMainFrame,
    required this.request,
    this.securityOrigin,
  });
}

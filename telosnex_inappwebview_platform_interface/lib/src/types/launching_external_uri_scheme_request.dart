import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../web_uri.dart';
import 'enum_method.dart';

part 'launching_external_uri_scheme_request.g.dart';

///Class that represents the request used by the [PlatformWebViewCreationParams.onLaunchingExternalUriScheme] event.
@ExchangeableObject()
class LaunchingExternalUriSchemeRequestSpec {
  ///The URI with the external URI scheme to be launched.
  WebUri uri;

  ///The origin initiating the external URI scheme launch.
  WebUri? initiatingOrigin;

  ///Whether the external URI scheme request was initiated through a user gesture.
  bool? isUserInitiated;

  LaunchingExternalUriSchemeRequestSpec({
    required this.uri,
    this.initiatingOrigin,
    this.isUserInitiated,
  });
}

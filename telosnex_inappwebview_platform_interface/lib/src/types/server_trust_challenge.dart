import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'url_authentication_challenge.dart';
import 'url_protection_space.dart';
import 'enum_method.dart';

part 'server_trust_challenge.g.dart';

///Class that represents the challenge of the [PlatformWebViewCreationParams.onReceivedServerTrustAuthRequest] event.
///It provides all the information about the challenge.
@ExchangeableObject()
class ServerTrustChallengeSpec extends URLAuthenticationChallengeSpec {
  ServerTrustChallengeSpec({required super.protectionSpace});
}

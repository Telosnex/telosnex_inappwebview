import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'url_protection_space.dart';
import 'enum_method.dart';

part 'url_authentication_challenge.g.dart';

///Class that represents a challenge from a server requiring authentication from the client.
///It provides all the information about the challenge.
@ExchangeableObject()
class URLAuthenticationChallengeSpec {
  ///The protection space requiring authentication.
  URLProtectionSpaceSpec protectionSpace;

  URLAuthenticationChallengeSpec({required this.protectionSpace});
}

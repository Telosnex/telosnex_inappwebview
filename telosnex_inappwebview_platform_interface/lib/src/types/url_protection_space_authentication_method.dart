import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'url_protection_space.dart';

part 'url_protection_space_authentication_method.g.dart';

///Class that represents the constants describing known values of the [URLProtectionSpace.authenticationMethod] property.
@ExchangeableEnum()
class URLProtectionSpaceAuthenticationMethodSpec {
  // ignore: unused_field
  final String _value;
  const URLProtectionSpaceAuthenticationMethodSpec._internal(this._value);

  ///Use the default authentication method for a protocol.
  static const NSURL_AUTHENTICATION_METHOD_DEFAULT =
      URLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodDefault",
      );

  ///Use HTTP basic authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_BASIC =
      URLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodHTTPBasic",
      );

  ///Use HTTP digest authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST =
      URLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodHTTPDigest",
      );

  ///Use HTML form authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTML_FORM =
      URLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodHTMLForm",
      );

  ///Use client certificate authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE =
      URLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodClientCertificate",
      );

  ///Negotiate whether to use Kerberos or NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NEGOTIATE =
      URLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodNegotiate",
      );

  ///Use NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NTLM =
      URLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodNTLM",
      );

  ///Perform server trust authentication (certificate validation) for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_SERVER_TRUST =
      URLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodServerTrust",
      );
}

///An iOS-specific Class that represents the constants describing known values of the [URLProtectionSpace.authenticationMethod] property.
///Use [URLProtectionSpaceAuthenticationMethod] instead.
@Deprecated("Use URLProtectionSpaceAuthenticationMethod instead")
@ExchangeableEnum()
class IOSNSURLProtectionSpaceAuthenticationMethodSpec {
  // ignore: unused_field
  final String _value;
  const IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(this._value);

  ///Use the default authentication method for a protocol.
  static const NSURL_AUTHENTICATION_METHOD_DEFAULT =
      IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodDefault",
      );

  ///Use HTTP basic authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_BASIC =
      IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodHTTPBasic",
      );

  ///Use HTTP digest authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST =
      IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodHTTPDigest",
      );

  ///Use HTML form authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTML_FORM =
      IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodHTMLForm",
      );

  ///Use client certificate authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE =
      IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodClientCertificate",
      );

  ///Negotiate whether to use Kerberos or NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NEGOTIATE =
      IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodNegotiate",
      );

  ///Use NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NTLM =
      IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodNTLM",
      );

  ///Perform server trust authentication (certificate validation) for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_SERVER_TRUST =
      IOSNSURLProtectionSpaceAuthenticationMethodSpec._internal(
        "NSURLAuthenticationMethodServerTrust",
      );
}

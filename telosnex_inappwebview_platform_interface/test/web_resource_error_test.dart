import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telosnex_inappwebview_platform_interface/telosnex_inappwebview_platform_interface.dart';

// The enum's native values are computed on first use, for the platform of
// that moment, so this file is macOS throughout.
void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.macOS;

  WebResourceErrorType typeOf(int code) =>
      WebResourceError.fromMap({'type': code, 'description': 'd'})!.type;

  test('a known code maps to its type', () {
    expect(typeOf(-1003), WebResourceErrorType.HOST_LOOKUP);
    expect(typeOf(-1001), WebResourceErrorType.TIMEOUT);
  });

  test('NSURLErrorDNSLookupFailed (-1006) is HOST_LOOKUP', () {
    expect(typeOf(-1006), WebResourceErrorType.HOST_LOOKUP);
  });

  test('an unknown code is UNKNOWN, not an exception', () {
    expect(typeOf(-123456), WebResourceErrorType.UNKNOWN);
  });
}

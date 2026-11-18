@TestOn('browser')
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:telosnex_inappwebview/telosnex_inappwebview.dart';
import 'package:telosnex_inappwebview_web/telosnex_inappwebview_web.dart';

void main() {
  test('Web reports the localhost server as unsupported', () async {
    WebPlatformInAppWebViewPlatform.registerWith();

    expect(InAppLocalhostServer.isClassSupported(), isFalse);
    expect(
      InAppLocalhostServer.isMethodSupported(
        PlatformInAppLocalhostServerMethod.start,
      ),
      isFalse,
    );
    final server = InAppLocalhostServer();
    await expectLater(server.start(), throwsUnsupportedError);
    expect(server.isRunning(), isFalse);
    await server.close();
  });
}

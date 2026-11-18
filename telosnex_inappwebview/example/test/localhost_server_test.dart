@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:telosnex_inappwebview/telosnex_inappwebview.dart';

class _TestPlatform extends InAppWebViewPlatform {}

void main() {
  test(
    'starts and closes a native server with a typed request callback',
    () async {
      InAppWebViewPlatform.instance = _TestPlatform();
      Future<bool> onData(HttpRequest request) async => false;
      final server = InAppLocalhostServer(port: 0, onData: onData);
      addTearDown(server.close);

      expect(InAppLocalhostServer.isClassSupported(), isTrue);
      expect(server.onData, same(onData));
      expect(server.isRunning(), isFalse);
      await server.start();
      expect(server.isRunning(), isTrue);
      await server.close();
      expect(server.isRunning(), isFalse);
    },
  );
}

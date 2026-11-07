import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:telosnex_inappwebview/telosnex_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util.dart';

part 'remove_data_modified_since.dart';

void main() {
  final shouldSkip = !WebStorageManager.isMethodSupported(
    PlatformWebStorageManagerMethod.removeDataModifiedSince,
  );

  skippableGroup('Web Storage Manager', () {
    final server = InAppLocalhostServer(port: _port);
    setUpAll(server.start);
    removeDataModifiedSince();
    tearDownAll(server.close);
  }, skip: shouldSkip);
}

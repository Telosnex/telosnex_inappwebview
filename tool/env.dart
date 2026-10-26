import 'dart:convert';
import 'dart:io';

/// Writes the example's integration_test/env.dart: the address of the Node
/// test server as the device sees it (NODE_SERVER_IP; default 127.0.0.1).
Future<void> main() async {
  final config = <String, String>{
    'NODE_SERVER_IP': Platform.environment['NODE_SERVER_IP'] ?? '127.0.0.1',
  };
  final filename = 'telosnex_inappwebview/example/integration_test/env.dart';
  await File(filename).writeAsString(
    'final environment = <String, String>${json.encode(config)};\n',
  );
}

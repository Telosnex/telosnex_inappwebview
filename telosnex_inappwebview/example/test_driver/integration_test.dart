import 'package:integration_test/integration_test_driver.dart';

// flutter drive (web): prints each failure, exits 1 on any. The timeout is
// for the whole run of one group (tool/run_integration_group.sh).
Future<void> main() => integrationDriver(timeout: const Duration(minutes: 14));

// flutter drive (web): telosnex_web_test's driver. It saves the page console
// to the log path that web-driver gives (TELOSNEX_WEB_TEST_CONSOLE), writes
// the report data (TELOSNEX_WEB_TEST_RESPONSE) and prints each failure. The
// timeout is for the whole run of one group (tool/run_integration_group.sh).
import 'package:telosnex_web_test/driver.dart';

Future<void> main() =>
    webIntegrationDriver(timeout: const Duration(minutes: 14));

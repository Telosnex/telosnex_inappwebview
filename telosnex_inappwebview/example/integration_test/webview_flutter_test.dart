import 'package:telosnex_inappwebview/telosnex_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'process_global_config/main.dart' as process_global_config_tests;
import 'in_app_webview/main.dart' as in_app_webview_tests;
import 'find_interaction_controller/main.dart'
    as find_interaction_controller_tests;
import 'service_worker_controller/main.dart' as service_worker_controller_tests;
import 'proxy_controller/main.dart' as proxy_controller_tests;
import 'headless_in_app_webview/main.dart' as headless_in_app_webview_tests;
import 'cookie_manager/main.dart' as cookie_manager_tests;
import 'web_storage_manager/main.dart' as web_storage_manager_tests;
import 'in_app_browser/main.dart' as in_app_browser_tests;
import 'chrome_safari_browser/main.dart' as chrome_safari_browser_tests;
import 'in_app_localhost_server/main.dart' as in_app_localhost_server_tests;
import 'tracing_controller/main.dart' as tracing_controller_tests;
import 'support_methods/main.dart' as support_methods_tests;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  PlatformInAppWebViewController.debugLoggingSettings.usePrint = true;
  PlatformInAppWebViewController.debugLoggingSettings.maxLogMessageLength =
      7000;
  PlatformInAppBrowser.debugLoggingSettings.usePrint = true;
  PlatformInAppBrowser.debugLoggingSettings.maxLogMessageLength = 7000;
  PlatformChromeSafariBrowser.debugLoggingSettings.usePrint = true;
  PlatformChromeSafariBrowser.debugLoggingSettings.maxLogMessageLength = 7000;
  PlatformWebAuthenticationSession.debugLoggingSettings.usePrint = true;
  PlatformWebAuthenticationSession.debugLoggingSettings.maxLogMessageLength =
      7000;
  PlatformPullToRefreshController.debugLoggingSettings.usePrint = true;
  PlatformPullToRefreshController.debugLoggingSettings.maxLogMessageLength =
      7000;
  PlatformFindInteractionController.debugLoggingSettings.usePrint = true;
  PlatformFindInteractionController.debugLoggingSettings.maxLogMessageLength =
      7000;

  // IAW_GROUP (a --dart-define) runs one group, so each group gets its own
  // app launch and a crash or hang stops only that group. Unset: all, each
  // unit of tool/run_integration_group.sh in a group named [unit] (in its
  // order), so a failure in the one launch says which unit to run again.
  const only = String.fromEnvironment('IAW_GROUP');
  final groups = <String, void Function()>{
    'process_global_config': process_global_config_tests.main,
    'in_app_webview': in_app_webview_tests.main,
    'find_interaction_controller': find_interaction_controller_tests.main,
    'service_worker_controller': service_worker_controller_tests.main,
    'proxy_controller': proxy_controller_tests.main,
    'tracing_controller': tracing_controller_tests.main,
    'headless_in_app_webview': headless_in_app_webview_tests.main,
    'cookie_manager': cookie_manager_tests.main,
    'web_storage_manager': web_storage_manager_tests.main,
    'in_app_browser': in_app_browser_tests.main,
    'chrome_safari_browser': chrome_safari_browser_tests.main,
    'in_app_localhost_server': in_app_localhost_server_tests.main,
    'support_methods': support_methods_tests.main,
  };
  if (only.isEmpty) {
    for (final MapEntry(key: name, value: tests) in groups.entries) {
      if (name == 'in_app_webview') {
        // After support_methods, as the runner's units.
        continue;
      }
      group('[$name]', tests);
    }
    for (var i = 0; i < 6; i++) {
      group(
        '[in_app_webview:$i/6]',
        () => in_app_webview_tests.main(shardOverride: '$i/6'),
      );
    }
  } else {
    final group = groups[only];
    if (group == null) {
      throw ArgumentError('IAW_GROUP=$only; groups: ${groups.keys.join(', ')}');
    }
    group();
  }
}

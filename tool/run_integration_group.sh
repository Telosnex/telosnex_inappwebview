#!/bin/bash
# Runs the example's integration tests one app launch per unit, with the Node
# test server running. A crash or hang stops only its unit.
#
#   tool/run_integration_group.sh <device> [unit...]
#
# A unit is a group of integration_test/webview_flutter_test.dart (for
# example cookie_manager) or an in_app_webview shard (in_app_webview:2/6).
# No units: every group, with in_app_webview in 6 shards.
#
# Environment:
#   IAW_LIMIT       Seconds per unit (default 900). macOS has no timeout(1);
#                   a perl alarm stops the launch.
#   NODE_SERVER_IP  The test server address as the device sees it. Default:
#                   the Mac's network address on macOS (the WebView's
#                   requests to 127.0.0.1 failed there), else 127.0.0.1.
#                   The Android emulator needs 10.0.2.2.
#   IAW_DRIVER      web: run with flutter drive on the web-server device
#                   (start chromedriver or another WebDriver first).
#
# Logs: $IAW_LOGS (default /tmp/iaw)/<unit>.log. Exit 1 if any unit failed.
set -u
device=$1; shift
limit=${IAW_LIMIT:-900}
logs=${IAW_LOGS:-/tmp/iaw}
root=$(cd "$(dirname "$0")/.." && pwd)
mkdir -p "$logs"

units=("$@")
if [[ ${#units[@]} -eq 0 ]]; then
  units=(process_global_config find_interaction_controller
    service_worker_controller proxy_controller tracing_controller
    headless_in_app_webview cookie_manager web_storage_manager in_app_browser
    chrome_safari_browser in_app_localhost_server support_methods)
  for i in 0 1 2 3 4 5; do units+=("in_app_webview:$i/6"); done
fi

if [[ -z "${NODE_SERVER_IP:-}" ]]; then
  NODE_SERVER_IP=127.0.0.1
  if [[ "$(uname)" == Darwin ]]; then
    NODE_SERVER_IP=$(ipconfig getifaddr en0 || echo 127.0.0.1)
  fi
fi
echo "Test server address for the device: $NODE_SERVER_IP"
NODE_SERVER_IP=$NODE_SERVER_IP dart "$root/tool/env.dart"

(cd "$root/test_node_server" && exec node index.js) > "$logs/node.log" 2>&1 < /dev/null &
node=$!
trap 'kill $node 2>/dev/null' EXIT
sleep 2
if ! kill -0 $node 2>/dev/null; then
  echo "The Node test server did not start:"; tail -20 "$logs/node.log"; exit 1
fi

cd "$root/flutter_inappwebview/example"
wrap=()
if [[ "$(uname)" == Linux ]]; then wrap=(dbus-run-session -- xvfb-run -a); fi

failed=()
summary="| Unit | Result | Seconds |"$'\n'"|---|---|---|"$'\n'
for unit in "${units[@]}"; do
  defines=()
  case "$unit" in
    in_app_webview:*) defines=(--dart-define=IAW_GROUP=in_app_webview "--dart-define=IAW_SHARD=${unit#in_app_webview:}") ;;
    *) defines=("--dart-define=IAW_GROUP=$unit") ;;
  esac
  log="$logs/${unit//[:\/]/_}.log"
  if [[ "${IAW_DRIVER:-}" == web ]]; then
    run=(flutter drive --driver=test_driver/integration_test.dart
      --target=integration_test/webview_flutter_test.dart -d web-server
      --browser-name="${IAW_BROWSER:-chrome}" "${defines[@]}")
  else
    run=(flutter test integration_test/webview_flutter_test.dart -d "$device"
      -r expanded "${defines[@]}")
  fi
  start=$(date +%s)
  perl -e 'alarm shift; exec @ARGV' "$limit" ${wrap[@]+"${wrap[@]}"} "${run[@]}" > "$log" 2>&1 < /dev/null
  code=$?
  seconds=$(( $(date +%s) - start ))
  pkill -f flutter_inappwebview_example 2>/dev/null
  result=$(grep -oE '\+[0-9]+( ~[0-9]+)?( -[0-9]+)?: (All tests passed|Some tests failed)' "$log" | tail -1)
  if [[ $code == 142 ]]; then
    result="timed out after ${limit}s at $(grep -oE '^[0-9:]+ \+[0-9]+( ~[0-9]+)?( -[0-9]+)?' "$log" | tail -1)"
  elif [[ $code == 79 ]]; then
    result="no tests on this platform"; code=0
  fi
  [[ $code != 0 ]] && failed+=("$unit")
  echo "::group::$unit: exit $code, ${seconds}s, ${result:-no summary}"
  grep -E '\[E\]$' "$log" | sed -E 's/^[0-9:]+ \+[0-9]+ ~?[0-9]* ?-[0-9]+: //' | head -40
  [[ -z "$result" ]] && tail -40 "$log"
  echo "::endgroup::"
  summary+="| $unit | ${result:-exit $code, no summary} | $seconds |"$'\n'
done

if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then printf '%s' "$summary" >> "$GITHUB_STEP_SUMMARY"; fi
printf '%s' "$summary"
if [[ ${#failed[@]} -gt 0 ]]; then echo "Failed: ${failed[*]}"; exit 1; fi

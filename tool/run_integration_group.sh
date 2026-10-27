#!/bin/bash
# Runs the example's integration tests, with the Node test server running,
# one app launch per unit, so a crash or hang stops only its unit.
#
#   tool/run_integration_group.sh <device> [unit...]
#
# A unit is a group of integration_test/webview_flutter_test.dart (for
# example cookie_manager) or an in_app_webview shard (in_app_webview:2/6).
# No units: every group, with in_app_webview in 6 shards, all in one launch
# first; the units with a failure (or, after a crash or timeout, those not
# finished) then run again with a launch each, and their results count.
#
# Environment:
#   IAW_LIMIT       Seconds per unit (default 900). macOS has no timeout(1);
#                   a perl alarm stops the launch.
#   NODE_SERVER_IP  The test server address as the device sees it. Default:
#                   the Mac's network address on macOS (the WebView's
#                   requests to 127.0.0.1 failed there), else 127.0.0.1.
#                   The Android emulator needs 10.0.2.2.
#   IAW_TEST_TIMEOUT  Per test (flutter test --timeout, e.g. 45s).
#   IAW_ONE_LAUNCH  0: no one-launch run first.
#   IAW_ONE_LAUNCH_LIMIT  Seconds for the one launch (default 1200).
#   IAW_NO_VIDEO    1: skip the tests that play a video (passed to the app as
#                   --dart-define=IAW_NO_VIDEO=1).
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
all=0
if [[ ${#units[@]} -eq 0 ]]; then
  all=1
  units=(process_global_config find_interaction_controller
    service_worker_controller proxy_controller tracing_controller
    headless_in_app_webview cookie_manager web_storage_manager
    in_app_localhost_server support_methods)
  for i in 0 1 2 3 4 5; do units+=("in_app_webview:$i/6"); done
  # Last: they cover the app with another activity. On CI's Android emulator
  # Flutter could not draw again after that (EGL_BAD_ACCESS on every frame),
  # so later webviews stayed 0x0.
  units+=(in_app_browser chrome_safari_browser)
fi

if [[ -z "${NODE_SERVER_IP:-}" ]]; then
  NODE_SERVER_IP=127.0.0.1
  if [[ "$(uname)" == Darwin ]]; then
    NODE_SERVER_IP=$(ipconfig getifaddr en0 || echo 127.0.0.1)
  fi
fi
echo "Test server address for the device: $NODE_SERVER_IP"
NODE_SERVER_IP=$NODE_SERVER_IP dart "$root/tool/env.dart"

# A test server already running (shared by runs for several devices at
# once) is used as is.
if curl -s -o /dev/null -m 2 http://127.0.0.1:8082/; then
  echo "Using the test server already running."
else
  (cd "$root/test_node_server" && exec node index.js) > "$logs/node.log" 2>&1 < /dev/null &
  node=$!
  trap 'kill $node 2>/dev/null' EXIT
  sleep 2
  if ! kill -0 $node 2>/dev/null; then
    echo "The Node test server did not start:"; tail -20 "$logs/node.log"; exit 1
  fi
fi

cd "$root/telosnex_inappwebview/example"
wrap=()
# Linux without a display (CI): a virtual X server and session bus, with an
# unlocked keyring (HTTP auth credentials are stored as secrets) when
# gnome-keyring is installed.
if [[ "$(uname)" == Linux && -z "${WAYLAND_DISPLAY:-}${DISPLAY:-}" ]]; then
  wrap=(dbus-run-session -- bash -c 'if command -v gnome-keyring-daemon > /dev/null; then
      echo | gnome-keyring-daemon --unlock --components=secrets > /dev/null 2>&1; fi
    exec xvfb-run -a "$@"' _)
fi

failed=()
summary="| Unit | Result | Seconds |"$'\n'"|---|---|---|"$'\n'
# Stops a launch: the process and, on Windows, its native process tree
# (flutter.bat, dart, the app), which signals do not reach.
stop_launch() {
  if [[ "$(uname)" == MINGW* || "$(uname)" == MSYS* ]]; then
    local winpid
    winpid=$(cat /proc/$1/winpid 2>/dev/null)
    [[ -n $winpid ]] && taskkill //f //t //pid "$winpid" > /dev/null 2>&1
  fi
  kill $1 2>/dev/null
}

# launch <log> <limit> [define...]: one app launch. Sets code (0, 1, 79 no
# tests, 142 timed out), seconds and result.
launch() {
  local log=$1 lim=$2; shift 2
  local run
  if [[ "${IAW_DRIVER:-}" == web ]]; then
    run=(flutter drive --driver=test_driver/integration_test.dart
      --target=integration_test/webview_flutter_test.dart -d web-server
      --browser-name="${IAW_BROWSER:-chrome}" "$@")
  else
    run=(flutter test integration_test/webview_flutter_test.dart -d "$device"
      -r expanded ${IAW_TEST_TIMEOUT:+--timeout "$IAW_TEST_TIMEOUT"}
      ${IAW_NO_VIDEO:+--dart-define=IAW_NO_VIDEO=$IAW_NO_VIDEO} "$@")
  fi
  local start pid notests=0 timedout=0
  start=$(date +%s)
  perl -e 'alarm shift; exec @ARGV' "$lim" ${wrap[@]+"${wrap[@]}"} "${run[@]}" > "$log" 2>&1 < /dev/null &
  pid=$!
  while kill -0 $pid 2>/dev/null; do
    # No tests for this platform: flutter test exits 79, but with a desktop
    # session the app's window stays open and the launch waited for the limit.
    if grep -q 'No tests ran' "$log"; then
      notests=1; sleep 2; stop_launch $pid; break
    fi
    # The perl alarm does not reach native processes on Windows: the limit
    # is kept here too.
    if (( $(date +%s) - start >= lim + 5 )); then
      timedout=1; stop_launch $pid; break
    fi
    sleep 1
  done
  wait $pid
  code=$?
  [[ $notests == 1 ]] && code=79
  [[ $timedout == 1 ]] && code=142
  seconds=$(( $(date +%s) - start ))
  # Only this checkout's app (its build folder): runs for other devices on
  # the same machine have their own.
  if [[ "$(uname)" == MINGW* || "$(uname)" == MSYS* ]]; then
    # Windows: the app is example.exe. One left running locks its DLLs, and
    # the next launch's build fails.
    taskkill //f //im example.exe > /dev/null 2>&1
  else
    pkill -f "$PWD/build/.*telosnex_inappwebview_example" 2>/dev/null
  fi
  result=$(grep -oE '\+[0-9]+( ~[0-9]+)?( -[0-9]+)?: (All tests passed|Some tests failed)' "$log" | tail -1)
  if [[ "${IAW_DRIVER:-}" == web && -z "$result" ]]; then
    # integrationDriver: "All tests passed." or "Failure in method: <test>".
    if grep -q 'All tests passed' "$log"; then
      result="all tests passed"
    elif grep -q 'Failure in method:' "$log"; then
      result="failed: $(grep -c 'Failure in method:' "$log")"
    fi
  fi
  if [[ $code == 142 ]]; then
    result="timed out after ${lim}s at $(grep -oE '^[0-9:]+ \+[0-9]+( ~[0-9]+)?( -[0-9]+)?' "$log" | tail -1)"
  elif [[ $code == 79 ]]; then
    result="no tests on this platform"; code=0
  fi
}

# report <name> <log> [note]: the launch's group in the job log, and its row.
report() {
  echo "::group::$1: exit $code, ${seconds}s, ${result:-no summary}${3:+ ($3)}"
  grep -E '\[E\]$' "$2" | sed -E 's/^[0-9:]+ \+[0-9]+ ~?[0-9]* ?-[0-9]+: //' | head -40
  grep -E '^Failure in method:' "$2" | head -40
  [[ -z "$result" ]] && tail -40 "$2"
  echo "::endgroup::"
  summary+="| $1 | ${result:-exit $code, no summary}${3:+ ($3)} | $seconds |"$'\n'
}

run_unit() {
  local unit=$1 note=${2:-} defines
  case "$unit" in
    in_app_webview:*) defines=(--dart-define=IAW_GROUP=in_app_webview "--dart-define=IAW_SHARD=${unit#in_app_webview:}") ;;
    *) defines=("--dart-define=IAW_GROUP=$unit") ;;
  esac
  local log="$logs/${unit//[:\/]/_}.log"
  launch "$log" "$limit" "${defines[@]}"
  [[ $code != 0 ]] && failed+=("$unit")
  report "$unit" "$log" "$note"
}

if [[ $all == 1 && "${IAW_ONE_LAUNCH:-1}" == 1 ]]; then
  # Every unit in one launch first: building and starting the app is most
  # of a unit's time. Each unit is a group named [unit]. Units with a
  # failure, and on a crash or timeout the unit running then and those
  # after it, run again with a launch each, and their results count.
  log="$logs/all.log"
  launch "$log" "${IAW_ONE_LAUNCH_LIMIT:-1200}"
  report "all (one launch)" "$log"
  if [[ $code != 0 ]]; then
    rerun=()
    # Units with a failed test: "[E]" lines (flutter test) or "Failure in
    # method:" (flutter drive), whose names start with [unit].
    failing=$( { grep -E '\[E\]$' "$log"; grep -E '^Failure in method:' "$log"; } |
      grep -oE '\[[a-z_]+(:[0-9]/[0-9])?\]' | tr -d '[]' | sort -u)
    # The unit of the last test that started.
    last=$(grep -oE '^[0-9:]+ \+[0-9]+( ~[0-9]+)?( -[0-9]+)?: \[[a-z_]+(:[0-9]/[0-9])?\]' "$log" |
      grep -oE '\[[^]]+\]$' | tr -d '[]' | tail -1)
    # No summary line: the launch crashed or timed out (or, with flutter
    # drive, gave no progress): the last unit and the ones after it, and
    # with flutter drive and no progress, every unit.
    ended=1
    [[ $code == 142 || -z "$result" ]] && ended=0
    # A failure outside any unit (tearDownAll, loading): every unit.
    if grep -E '\[E\]$' "$log" | grep -vqE ': \[[a-z_]+(:[0-9]/[0-9])?\]'; then
      ended=0; last=
    fi
    reached=0
    [[ $ended == 0 && -z "$last" ]] && reached=1
    for unit in "${units[@]}"; do
      [[ $unit == "$last" ]] && reached=1
      if grep -qxF "$unit" <<< "$failing" || [[ $ended == 0 && $reached == 1 ]]; then
        rerun+=("$unit")
      fi
    done
    echo "Running again, a launch each: ${rerun[*]:-none}"
    for unit in "${rerun[@]}"; do
      run_unit "$unit" "again after the one launch"
    done
    # A failure that names no unit, after which nothing ran again.
    if [[ ${#rerun[@]} -eq 0 ]]; then failed+=("all"); fi
  fi
else
  for unit in "${units[@]}"; do
    run_unit "$unit"
  done
fi

if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then printf '%s' "$summary" >> "$GITHUB_STEP_SUMMARY"; fi
printf '%s' "$summary"
if [[ ${#failed[@]} -gt 0 ]]; then echo "Failed: ${failed[*]}"; exit 1; fi

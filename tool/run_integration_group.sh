#!/bin/bash
# Runs the example's integration tests whose names start with each argument,
# one app launch per name, with the Node test server running for the call.
#   tool/run_integration_group.sh <device> <seconds per name> <name>...
# Logs: /tmp/iaw_<n>.log. Prints one summary line per name.
set -u
device=$1; limit=$2; shift 2
root=$(cd "$(dirname "$0")/.." && pwd)

ip=127.0.0.1
if [[ "$(uname)" == Darwin ]]; then ip=$(ipconfig getifaddr en0 || echo 127.0.0.1); fi
NODE_SERVER_IP=$ip dart "$root/tool/env.dart"

(cd "$root/test_node_server" && exec node index.js) > /tmp/iaw_node.log 2>&1 < /dev/null &
node=$!
trap 'kill $node 2>/dev/null; wait $node 2>/dev/null' EXIT
sleep 2
if ! kill -0 $node 2>/dev/null; then echo "node server did not start:"; tail -5 /tmp/iaw_node.log; exit 1; fi

cd "$root/flutter_inappwebview/example"
i=0
for name in "$@"; do
  i=$((i + 1)); log=/tmp/iaw_$i.log
  start=$(date +%s)
  # perl alarm: macOS has no timeout(1). The alarm kills flutter test.
  perl -e 'alarm shift; exec @ARGV' "$limit" \
    flutter test integration_test/webview_flutter_test.dart -d "$device" \
    --plain-name "$name" -r expanded > "$log" 2>&1 < /dev/null
  code=$?
  pkill -f flutter_inappwebview_example 2>/dev/null
  summary=$(grep -oE '\+[0-9]+( ~[0-9]+)?( -[0-9]+)?: (All tests passed|Some tests failed)' "$log" | tail -1)
  [[ $code == 142 ]] && summary="TIMED OUT after ${limit}s ($(grep -oE '^[0-9:]+ \+[0-9]+( ~[0-9]+)?( -[0-9]+)?' "$log" | tail -1))"
  echo "== $name: exit $code, $(( $(date +%s) - start ))s, ${summary:-no summary}"
  grep -E '\[E\]$' "$log" | sed -E 's/^[0-9:]+ \+[0-9]+ ~?[0-9]* ?-[0-9]+: //' | head -6 | cut -c1-120
done

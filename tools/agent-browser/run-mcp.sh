#!/usr/bin/env bash
set -Eeuo pipefail

STATE_DIR="$HOME/.agent-browser"
CONFIG="${AGENT_BROWSER_CONFIG:-$STATE_DIR/amoot.config.json}"

if ! command -v agent-browser >/dev/null 2>&1; then
  echo "ERROR: agent-browser is not installed or not on PATH." >&2
  exit 127
fi
if [[ ! -s "$CONFIG" ]]; then
  echo "ERROR: Missing browser config: $CONFIG" >&2
  echo "Run tools/agent-browser/install-termux.sh first." >&2
  exit 1
fi

# Fail early with a useful message instead of letting MCP start with a stale
# Snap launcher or a missing browser executable.
CHROME="$(node -e 'const c=require(process.argv[1]); process.stdout.write(c.executablePath || "")' "$CONFIG")"
if [[ -z "$CHROME" || ! -x "$CHROME" ]]; then
  echo "ERROR: Chromium executable from $CONFIG is missing or not executable: $CHROME" >&2
  exit 1
fi

export AGENT_BROWSER_CONFIG="$CONFIG"
exec agent-browser mcp --tools core,network,state,tabs

#!/usr/bin/env bash
set -Eeuo pipefail
CONFIG="$HOME/.agent-browser/amoot.config.json"
if [[ ! -s "$CONFIG" ]]; then
  echo "Missing $CONFIG. Run install-termux.sh first." >&2
  exit 1
fi
export AGENT_BROWSER_CONFIG="$CONFIG"
exec agent-browser mcp --tools core,network,state,tabs

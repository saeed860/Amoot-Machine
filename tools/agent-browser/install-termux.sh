#!/usr/bin/env bash
set -Eeuo pipefail

# Install agent-browser in Ubuntu/proot on Android (aarch64) or regular Linux.
if ! command -v apt-get >/dev/null 2>&1; then
  echo "ERROR: Run this inside Ubuntu/Debian (apt-get is required)." >&2
  exit 1
fi
if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
  echo "ERROR: Node.js and npm are required. Install Node.js 20+ first." >&2
  exit 1
fi
NODE_MAJOR="$(node -p 'Number(process.versions.node.split(".")[0])')"
if (( NODE_MAJOR < 20 )); then
  echo "ERROR: Node.js 20+ required; found $(node --version)." >&2
  exit 1
fi

CHROME=""
for candidate in chromium chromium-browser google-chrome google-chrome-stable; do
  if command -v "$candidate" >/dev/null 2>&1; then
    CHROME="$(command -v "$candidate")"
    break
  fi
done

if [[ -z "$CHROME" ]]; then
  echo "Installing system Chromium (agent-browser's bundled Chrome does not ship for Linux ARM64)..."
  apt-get update
  if ! apt-get install -y chromium; then
    apt-get install -y chromium-browser
  fi
  for candidate in chromium chromium-browser google-chrome google-chrome-stable; do
    if command -v "$candidate" >/dev/null 2>&1; then
      CHROME="$(command -v "$candidate")"
      break
    fi
  done
fi

if [[ -z "$CHROME" ]]; then
  echo "ERROR: Chromium was not found after installation. Install a working system Chromium and rerun." >&2
  exit 1
fi

npm install --global agent-browser
AB="$(command -v agent-browser)"
STATE_DIR="$HOME/.agent-browser"
PROFILE_DIR="$STATE_DIR/amoot-profile"
CONFIG="$STATE_DIR/amoot.config.json"
mkdir -p "$PROFILE_DIR"
chmod 700 "$STATE_DIR" "$PROFILE_DIR"

node - "$CONFIG" "$CHROME" "$PROFILE_DIR" <<'NODE'
const fs = require('node:fs');
const [file, executablePath, profile] = process.argv.slice(2);
fs.writeFileSync(file, JSON.stringify({
  executablePath,
  profile,
  headed: false
}, null, 2) + "\n", { mode: 0o600 });
NODE
chmod 600 "$CONFIG"

echo
echo "PASS: agent-browser installed: $AB"
echo "PASS: Chromium executable: $CHROME"
echo "PASS: persistent browser profile: $PROFILE_DIR"
echo "PASS: MCP launcher: $(cd "$(dirname "$0")" && pwd)/run-mcp.sh"
echo
echo "Next: run the MCP launcher once to validate it:"
echo "  $(cd "$(dirname "$0")" && pwd)/run-mcp.sh"

#!/usr/bin/env bash
set -Eeuo pipefail

# Install agent-browser in Ubuntu/proot on Android (including Linux ARM64).
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

STATE_DIR="$HOME/.agent-browser"
PROFILE_DIR="$STATE_DIR/amoot-profile"
CONFIG="$STATE_DIR/amoot.config.json"
mkdir -p "$PROFILE_DIR"
chmod 700 "$STATE_DIR" "$PROFILE_DIR"

# Ubuntu's chromium-browser package can be a Snap-only launcher in proot.
# Accept a system browser only if it actually executes.
find_working_chrome() {
  local candidate
  for candidate in chromium chromium-browser google-chrome google-chrome-stable; do
    if command -v "$candidate" >/dev/null 2>&1; then
      candidate="$(command -v "$candidate")"
      if "$candidate" --version >/dev/null 2>&1; then
        printf '%s\n' "$candidate"
        return 0
      fi
    fi
  done
  return 1
}

CHROME="$(find_working_chrome || true)"

if [[ -z "$CHROME" ]]; then
  echo "No runnable system Chromium found; checking Ubuntu packages..."
  apt-get update
  apt-get install -y chromium || apt-get install -y chromium-browser || true
  CHROME="$(find_working_chrome || true)"
fi

# Playwright supplies a Linux ARM64 Chromium build even though Chrome for Testing
# does not publish one for this architecture.
if [[ -z "$CHROME" ]]; then
  echo "Installing Playwright Chromium for this architecture..."
  npm install --prefix "$STATE_DIR/pw" playwright
  "$STATE_DIR/pw/node_modules/.bin/playwright" install chromium
  CHROME="$(find "$HOME/.cache/ms-playwright" -type f -name chrome -perm -111 2>/dev/null | head -n 1 || true)"
  if [[ -n "$CHROME" ]] && ! "$CHROME" --version >/dev/null 2>&1; then
    CHROME=""
  fi
fi

if [[ -z "$CHROME" ]]; then
  echo "ERROR: No runnable Chromium was found or installed." >&2
  exit 1
fi

npm install --global agent-browser
AB="$(command -v agent-browser)"

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
echo "PASS: runnable Chromium: $CHROME"
echo "PASS: persistent browser profile: $PROFILE_DIR"
echo "PASS: browser config: $CONFIG"
echo "PASS: MCP launcher: $(cd "$(dirname "$0")" && pwd)/run-mcp.sh"
echo
echo "Next: validate the MCP tool call with:"
echo "  AGENT_BROWSER_CONFIG=\"$CONFIG\" agent-browser mcp call agent_browser_open '{\"url\":\"https://example.com\"}'"

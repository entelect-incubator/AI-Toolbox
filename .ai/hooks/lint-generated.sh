#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

if [ -f "$ROOT_DIR/package.json" ]; then
  if command -v npm >/dev/null 2>&1; then
    npm run lint --prefix "$ROOT_DIR"
    echo "Lint completed."
    exit 0
  fi
fi

echo "No lint command configured. Skipping lint-generated step."

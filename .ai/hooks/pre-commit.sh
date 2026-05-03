#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo "Running AI toolbox pre-commit checks..."
bash "$ROOT_DIR/.ai/hooks/validate-specs.sh"
bash "$ROOT_DIR/.ai/hooks/lint-generated.sh"

echo "Pre-commit checks passed."

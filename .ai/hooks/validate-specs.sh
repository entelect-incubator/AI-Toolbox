#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
FEATURE_SPECS_DIR="$ROOT_DIR/.ai/specs/features"

if ! command -v rg >/dev/null 2>&1; then
  echo "ripgrep (rg) is required for validation."
  exit 1
fi

mapfile -t specs < <(rg --files "$FEATURE_SPECS_DIR" -g "*.md")

if [ "${#specs[@]}" -eq 0 ]; then
  echo "No feature specs found in .ai/specs/features"
  exit 1
fi

required_headers=(
  "## Context"
  "## Inputs"
  "## Outputs"
  "## Rules"
  "## Acceptance Criteria"
)

for spec in "${specs[@]}"; do
  for header in "${required_headers[@]}"; do
    if ! rg -n "^${header}$" "$spec" >/dev/null; then
      echo "Missing header '${header}' in ${spec}"
      exit 1
    fi
  done
done

echo "Spec validation passed (${#specs[@]} file(s))."

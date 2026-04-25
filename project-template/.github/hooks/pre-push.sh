#!/usr/bin/env bash
set -euo pipefail

# Run the first available test command for quick push-time validation.
if [[ -f "package.json" ]]; then
  if command -v npm >/dev/null 2>&1; then
    npm test -- --watch=false
    exit 0
  fi
fi

if [[ -f "pyproject.toml" || -d "tests" ]]; then
  if command -v pytest >/dev/null 2>&1; then
    pytest -q
    exit 0
  fi
fi

echo "No supported test runner found for pre-push hook; skipping."

#!/usr/bin/env bash
set -euo pipefail

# Example pre-task guard: block direct edits to generated files.
if git diff --name-only | grep -E '^generated/' >/dev/null 2>&1; then
  echo "Blocked: generated/ files should not be edited directly."
  exit 1
fi

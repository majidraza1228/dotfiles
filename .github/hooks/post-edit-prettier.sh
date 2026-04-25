#!/usr/bin/env bash
set -euo pipefail

if ! command -v prettier >/dev/null 2>&1; then
  echo "Prettier is required. Install it first (example: npm i -D prettier)."
  exit 1
fi

if [[ $# -eq 0 ]]; then
  echo "Usage: post-edit-prettier.sh <file1> [file2 ...]"
  exit 0
fi

prettier --write --ignore-unknown "$@"
echo "Formatted with Prettier: $*"

#!/usr/bin/env bash
set -euo pipefail

# Fast safety checks first.
./.github/hooks/check-merge-markers.sh
./.github/hooks/check-secrets.sh

if ! command -v prettier >/dev/null 2>&1; then
  echo "Prettier is required for pre-commit checks. Install it first."
  echo "Example: npm install --save-dev prettier"
  exit 1
fi

staged_files="$(git diff --cached --name-only --diff-filter=ACMR)"
if [[ -z "${staged_files}" ]]; then
  exit 0
fi

echo "${staged_files}" | xargs prettier --check --ignore-unknown

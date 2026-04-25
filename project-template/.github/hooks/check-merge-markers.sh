#!/usr/bin/env bash
set -euo pipefail

staged_files="$(git diff --cached --name-only --diff-filter=ACMR)"
if [[ -z "${staged_files}" ]]; then
  exit 0
fi

if echo "${staged_files}" | xargs grep -nE '^(<<<<<<<|=======|>>>>>>>)' >/dev/null 2>&1; then
  echo "Merge conflict markers found in staged files. Resolve them before commit."
  exit 1
fi

#!/usr/bin/env bash
set -euo pipefail

# Scan newly added staged lines for obvious secret patterns.
if ! git rev-parse --git-dir >/dev/null 2>&1; then
  exit 0
fi

if ! git diff --cached --quiet; then
  if git diff --cached -U0 | grep -E '^\+.*(AKIA[0-9A-Z]{16}|-----BEGIN (RSA|EC|OPENSSH|DSA) PRIVATE KEY-----|ghp_[A-Za-z0-9]{36}|xox[baprs]-[A-Za-z0-9-]{10,}|AIza[0-9A-Za-z_-]{35}|sk_(live|test)_[A-Za-z0-9]{16,})' >/dev/null 2>&1; then
    echo "Potential secret detected in staged changes. Remove it before committing."
    exit 1
  fi
fi

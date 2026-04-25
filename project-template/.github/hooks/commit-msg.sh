#!/usr/bin/env bash
set -euo pipefail

msg_file="${1:-}"
if [[ -z "${msg_file}" || ! -f "${msg_file}" ]]; then
  echo "Usage: commit-msg.sh <commit-msg-file>"
  exit 1
fi

message="$(head -n1 "${msg_file}" | tr -d '\r')"

if [[ "${#message}" -lt 10 ]]; then
  echo "Commit message is too short. Use at least 10 characters."
  exit 1
fi

if echo "${message}" | grep -qiE '^(wip|tmp|test)$'; then
  echo "Commit message is too vague. Use a descriptive summary."
  exit 1
fi

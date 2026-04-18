#!/bin/bash
# Post-edit hook — runs after every file edit or write
# Use this to auto-lint, log changes, or trigger checks

FILE="$CLAUDE_TOOL_INPUT"

# Auto-lint Python files after edit
if echo "$FILE" | grep -q "\.py$"; then
  if command -v flake8 &>/dev/null; then
    flake8 "$FILE" --max-line-length=100 --quiet
  fi
fi

exit 0

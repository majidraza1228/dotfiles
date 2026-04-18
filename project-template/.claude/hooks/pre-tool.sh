#!/bin/bash
# Pre-tool hook — runs before every Bash tool call
# Exit 1 to BLOCK the tool. Exit 0 to allow it.

COMMAND="$CLAUDE_TOOL_INPUT"

# Block force pushes
if echo "$COMMAND" | grep -q "push --force"; then
  echo "BLOCKED: force push is not allowed." >&2
  exit 1
fi

# Block dropping tables
if echo "$COMMAND" | grep -iq "DROP TABLE"; then
  echo "BLOCKED: DROP TABLE requires manual execution." >&2
  exit 1
fi

# Block deleting all records
if echo "$COMMAND" | grep -iq "DELETE FROM.*WHERE" ; then
  # Allow targeted deletes
  exit 0
fi

if echo "$COMMAND" | grep -iq "DELETE FROM" && ! echo "$COMMAND" | grep -iq "WHERE"; then
  echo "BLOCKED: DELETE without WHERE clause is not allowed." >&2
  exit 1
fi

exit 0

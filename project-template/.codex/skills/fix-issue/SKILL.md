---
name: "fix-issue"
description: "Follow a small, test-first workflow to diagnose and fix repository issues without broad refactors."
---

# Fix Issue

## Workflow

1. Reproduce the issue with the existing project commands.
2. Read the narrowest set of files required.
3. Add or update a focused test when feasible.
4. Implement the smallest fix that resolves the root cause.
5. Run the relevant tests and summarize what changed.

## Rules

- Avoid broad rewrites while fixing a targeted issue.
- Preserve existing repository patterns unless they caused the bug.
- If you cannot reproduce the issue, explain what was tried before changing code.

---
name: "code-review"
description: "Review changes for bugs, regressions, missing tests, and risky assumptions before code is finalized."
---

# Code Review

## Workflow

1. Inspect the diff or changed files first.
2. Focus on correctness, regressions, security, and test coverage.
3. Prefer concrete findings over style opinions.
4. Reference the affected files and the practical impact of each issue.
5. Note testing gaps or assumptions when evidence is incomplete.

## Output Standard

- Present findings first, ordered by severity.
- Keep summaries brief.
- If no issues are found, state that explicitly and mention residual risk.

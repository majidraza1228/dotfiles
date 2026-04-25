---
name: "security-review"
description: "Review repository changes for secrets exposure, auth mistakes, unsafe command execution, and avoidable security risk."
---

# Security Review

## Workflow

1. Inspect the diff or changed files first.
2. Focus on auth, secret handling, permissions, unsafe shell usage, injection, and sensitive data exposure.
3. Report concrete risks with file references.
4. Call out missing tests or validation for security-sensitive changes.
5. Summarize residual risk if verification is incomplete.

## Output Standard

- Findings first, ordered by severity.
- Include file references and why the issue matters.
- Recommend the smallest safe fix.

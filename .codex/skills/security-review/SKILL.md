---
name: "security-review"
description: "Review code or configuration changes for secrets exposure, unsafe commands, auth mistakes, injection risk, and missing security checks."
---

# Security Review

## Workflow

1. Inspect the diff or changed files first.
2. Focus on secrets, auth, permissions, unsafe command execution, injection, and data exposure.
3. Call out concrete exploit or failure paths, not vague concerns.
4. Note missing tests or verification for security-sensitive behavior.
5. State residual risk when evidence is incomplete.

## Output Standard

- Findings first, ordered by severity.
- Include file references and the practical impact.
- Recommend the smallest safe fix.

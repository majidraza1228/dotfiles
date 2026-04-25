---
name: "implement-feature"
description: "Implement a requested feature with a short plan, focused code changes, tests, and verification."
---

# Implement Feature

## Workflow

1. Clarify the requested behavior and success criteria.
2. Read the relevant code paths before editing.
3. Make the smallest changes that satisfy the request end to end.
4. Add or update tests for changed behavior.
5. Verify with the narrowest useful commands first.
6. Summarize the behavior change and what was verified.

## Rules

- Do not refactor unrelated code while implementing the feature.
- Reuse existing project patterns before introducing abstractions.
- If requirements are ambiguous, call out the assumption you used.

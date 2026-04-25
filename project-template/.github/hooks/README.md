# Hooks Standards

## Purpose

Automate safety checks around editing, commits, and workflow transitions.

## Standards

1. Hooks must be fast and deterministic.
2. Fail with clear messages when blocking action.
3. Never hide failures; non-zero exit on policy violations.
4. Keep hooks side-effect aware and idempotent.
5. Document prerequisites at the top of each script.

# Agent Standards

## Purpose

Define role-specific Copilot/agent behaviors for consistent outcomes.

## Why helpful

Agents provide clear persona-based execution (security reviewer, solution architect, code reviewer) with predictable outputs.

## How to use

1. Build with `/create agent` or from the customization UI.
2. Use one role per agent.
3. Reference agents in chat via `@agent` or agent picker.

## Standards

1. One role per agent (review, security, implementation, docs).
2. Declare exact responsibilities and out-of-scope items.
3. Require structured outputs (severity, file/line, fix).
4. Avoid overlapping agent scopes to reduce conflicting advice.
5. Keep agents deterministic and checklist-driven.

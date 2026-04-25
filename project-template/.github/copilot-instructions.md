# GitHub Copilot Instructions — [Project Name]

These instructions guide Copilot Chat in VS Code for this repository.

## Load Order

1. Read this file first.
2. Apply standards from `.github/instructions/`.
3. Use task templates from `.github/prompts/`.
4. Follow role guides in `.github/agents/` and `.github/skills/` when relevant.

## Core Behavior

1. Read relevant files before proposing changes.
2. Keep changes small and focused on the request.
3. Match existing code style and project patterns.
4. Do not refactor unrelated code unless explicitly requested.

## Engineering Standards

1. Prefer simple solutions over speculative abstractions.
2. Add or update tests for behavior changes.
3. Avoid broad exception handling and silent failures.
4. Never hardcode secrets, tokens, or credentials.

## Project Context

1. Stack: [Backend], [Database], [Frontend], [Infra]
2. Main entry points: [list key folders/files]
3. Testing command: [example: `pytest tests/ -v`]
4. Lint/format command: [example: `ruff check . && ruff format .`]

## Pull Request Quality Bar

Before finishing, ensure:

1. Requested behavior is implemented end-to-end.
2. Existing behavior remains intact unless intentionally changed.
3. Error messages are explicit and actionable.
4. Code is readable without unnecessary comments.

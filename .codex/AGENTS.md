# Global Codex Instructions (syedraza)

These instructions apply to every repository when Codex is used from this machine. Project-level `AGENTS.md` files should extend or override these defaults.

## Working Style

- Read relevant files before changing anything.
- Keep changes narrow and directly tied to the request.
- Match the existing style of the repository before introducing new patterns.
- State assumptions clearly when the task is ambiguous.
- Prefer concrete verification over "should work" reasoning.

## Communication

- Lead with the result or next action.
- Keep explanations short and technical.
- Avoid filler, long preambles, and motivational language.
- Call out tradeoffs when there is more than one reasonable path.

## Engineering Standards

- Prefer simple implementations over speculative abstractions.
- Update or add tests when behavior changes.
- Do not refactor unrelated code unless explicitly asked.
- Never hardcode secrets, tokens, or environment-specific credentials.
- Use project documentation and specs before inventing behavior.

## Git And Safety

- Never use destructive git commands unless explicitly requested.
- Stage only the files relevant to the task.
- Do not amend commits unless asked.
- Ask before adding new production dependencies.

## Verification

- Run the smallest useful verification first.
- If full verification is not possible, say what was not checked.
- Treat warnings, failing tests, and unclear output as work to resolve, not details to ignore.

# Codex Project Hooks

Use repository-local Codex hooks for deterministic checks around tool use and turn completion.

## Standards

- Keep hooks fast and deterministic.
- Prefer hooks for policy checks, not broad prompting.
- Return structured JSON when blocking or continuing a turn.
- Resolve hook paths from the git root in `config.toml`.
- Test hook scripts manually before enabling them in team configs.

## Included examples

- `pre_tool_use_policy.py` — blocks obviously dangerous Bash commands
- `permission_request.py` — denies escalations for blocked command patterns
- `stop_require_verification.py` — asks Codex to mention verification before finishing

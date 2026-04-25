# Codex Hooks

Use hooks when you need deterministic checks or lifecycle automation around Codex turns.

## Standards

- Prefer hooks for enforcement and automation, not long-form instructions.
- Keep scripts fast, deterministic, and side-effect aware.
- Return explicit JSON decisions when blocking or continuing a turn.
- Resolve repo-local hooks from the git root so they still work from subdirectories.
- Enable hooks intentionally in `config.toml`; do not assume they are on by default.

## Common uses

- block dangerous shell commands
- add context before editing starts
- review failures before Codex continues
- require verification before a turn ends

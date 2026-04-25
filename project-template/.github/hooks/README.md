# Hooks Standards

## Purpose

Automate safety checks around editing, commits, and workflow transitions.

## Standards

1. Hooks must be fast and deterministic.
2. Fail with clear messages when blocking action.
3. Never hide failures; non-zero exit on policy violations.
4. Keep hooks side-effect aware and idempotent.
5. Document prerequisites at the top of each script.

## Prettier hook

- `post-edit.sh` formats edited files with Prettier.
- `pre-commit.sh` runs quick safety checks + `prettier --check` on staged files.
- Prerequisite: install Prettier in the project (`npm i -D prettier`).
- Run manually: `./.github/hooks/post-edit.sh path/to/file.ts`
- Run pre-commit check manually: `./.github/hooks/pre-commit.sh`

## Additional best-practice hooks

- `check-secrets.sh` blocks obvious secret patterns in staged additions.
- `check-merge-markers.sh` blocks accidental conflict markers.
- `commit-msg.sh` blocks very short/vague commit messages.
- `pre-push.sh` runs tests before push (`npm test` or `pytest -q` when available).

## Git hook integration

Link hooks in a project after copying the template:

```bash
mkdir -p .git/hooks
ln -sf ../../.github/hooks/pre-commit.sh .git/hooks/pre-commit
ln -sf ../../.github/hooks/commit-msg.sh .git/hooks/commit-msg
ln -sf ../../.github/hooks/pre-push.sh .git/hooks/pre-push
```

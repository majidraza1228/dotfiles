# Hooks Standards

Hooks must be fast, deterministic, and fail loudly on policy violations.

## Why helpful

Hooks automate safety and quality tasks at lifecycle events (for example formatting, checks, policy guards).

## How to use

1. Generate hooks from Agent Customizations UI or `/create hook`.
2. Choose lifecycle event (such as post-tool-use/post-edit).
3. Keep scripts fast and deterministic.

## Prettier hook

- `post-edit-prettier.sh` formats files with Prettier.
- This root `.github/hooks/` folder is a reusable reference library.
- Canonical project-ready hooks live in `project-template/.github/hooks/`.

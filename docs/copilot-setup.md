# GitHub Copilot (VS Code) Setup Details

## Project-level structure

Copy these into each project:

- `project-template/.github/`
- `project-template/.vscode/`

## `.github/` purpose

- `copilot-instructions.md` — repo-level Copilot behavior
- `instructions/` — standards and guardrails
- `prompts/` — reusable workflow prompts
- `agents/` — role-based agent definitions
- `skills/` — capability-focused playbooks
- `hooks/` — automation hooks and standards
- `mcp-servers/` — MCP server config templates
- `plugins/` — extension/plugin policy and mapping
- `workflows/` — CI templates for quality checks

## `.vscode/` purpose

- `extensions.json` recommends Copilot-related extensions
- `settings.json` enables chat/inline behavior and points Copilot to `.github/copilot-instructions.md`

## Formatting defaults (project template)

- `.prettierrc.json` defines baseline formatting rules.
- `.prettierignore` excludes generated/build artifacts.
- `.github/hooks/post-edit.sh` auto-formats changed files with Prettier.
- `.github/hooks/pre-commit.sh` runs safety checks + `prettier --check` on staged files.
- `.github/hooks/commit-msg.sh` enforces basic commit message quality.
- `.github/hooks/pre-push.sh` runs available tests before push.
- `.github/workflows/prettier-check.yml` enforces formatting in CI.

## MCP and secrets

Use environment variables for credentials (never commit live secrets).  
Example template: `.github/mcp-servers/github.mcp.json`.

## Root `.github/` vs template `.github/`

- Root `.github/` in this dotfiles repo is a reusable **reference library**.
- `project-template/.github/` is the **canonical copy source** for new projects.

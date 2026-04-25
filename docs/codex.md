# Codex Setup Details

This repo now includes a dedicated `.codex/` structure for OpenAI Codex so the same dotfiles repository can support Claude, GitHub Copilot, and Codex workflows.

## What Was Added

### Global Codex files

- `.codex/AGENTS.md` — global instructions that Codex can load from `~/.codex/AGENTS.md`
- `.codex/config.toml` — user-level Codex defaults
- `.codex/hooks/` — hook standards and lifecycle automation guidance
- `.codex/mcp-servers/` — MCP guidance and reusable config snippets
- `.codex/rules/default.rules` — reusable command approval and safety rules
- `.codex/skills/` — reusable global Codex skills
- `.codex/plugins/` — plugin packaging guidance

### Project template files

- `project-template/.codex/AGENTS.md` — per-repository instructions
- `project-template/.codex/.gitignore` — ignores Codex local runtime artifacts
- `project-template/.codex/config.toml.example` — project-level Codex config example
- `project-template/.codex/hooks/` — repo-local Codex hook scripts
- `project-template/.codex/mcp-servers/` — project MCP snippets
- `project-template/.codex/rules/default.rules` — project-local rules
- `project-template/.codex/skills/` — repository-specific skills

## Recommended Codex Layering

Codex supports both global and repository-level instructions.

### Global layer

Use `~/.codex/` for stable defaults that should apply everywhere:

- communication style
- engineering standards
- default model and personality
- reusable hook and MCP guidance
- reusable rules
- reusable skills

This repo's `install.sh` links stable guidance into `~/.codex/` and seeds mutable files only when they do not already exist. That avoids replacing Codex runtime data such as auth, history, logs, session state, or machine-specific trust metadata.

### Repository layer

Use `<project>/.codex/` for project-specific guidance:

- repository expectations
- project-scoped hooks and MCP config
- local test and lint commands
- repo-specific workflows as skills
- project-local safety rules

The `AGENTS.md` file is the most important project-level entry point because Codex loads it automatically when working in the repository. For richer automation, pair it with `.codex/config.toml` or a committed `config.toml.example`.

## Files And Purpose

### `.codex/AGENTS.md`

Use this for durable working agreements. Good content includes:

- how to communicate
- how much to change
- what to verify
- git and dependency safety rules

### `.codex/config.toml`

Use this for user-level Codex defaults. The sample in this repo sets:

- `model = "gpt-5.3-codex"`
- `personality = "pragmatic"`
- `features.multi_agent = true`

As of April 25, 2026, OpenAI developer docs list `gpt-5.3-codex` as the default Codex-optimized model, so the sample config uses that instead of a general-purpose GPT-5 model.

### `.codex/hooks/`

Use hooks for deterministic lifecycle checks and automation. Current Codex docs support hook configuration in either `hooks.json` or inline `config.toml`.

This repo includes:

- hook standards in `.codex/hooks/README.md`
- a project template with example hook scripts and a matching `config.toml.example`

Suggested uses:

- block dangerous Bash commands before execution
- deny certain approval requests
- require verification language before a turn ends

### `.codex/mcp-servers/`

Use this folder to keep reviewed MCP examples and setup notes. Active MCP server configuration still belongs in `config.toml`.

The project template includes:

- `context7.example.toml`
- `config.toml.example` showing project-scoped MCP wiring

### `.codex/rules/default.rules`

Use rules for repeatable approval and safety behavior. This repo includes examples that:

- forbid `git push --force`
- forbid `rm -rf`
- allow `pytest`

### `.codex/skills/`

Use skills for repeatable workflows. Each skill should live in its own directory and include:

- `SKILL.md`
- optional `references/`
- optional `scripts/`
- optional `assets/`

This repo includes `fix-issue`, `code-review`, and `implement-feature` patterns so Codex has equivalents for bug fixing, review, and implementation workflows.

### `.codex/plugins/`

Use this area for plugin guidance and packaging notes. Codex plugins are distributed with a required manifest at `.codex-plugin/plugin.json`.

## Install And Scaffold

### Install global Codex files

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

This creates or updates:

- `~/.codex/AGENTS.md`
- `~/.codex/config.toml` if it does not already exist
- `~/.codex/rules/default.rules` if it does not already exist
- `~/.codex/skills/fix-issue`

### Scaffold Codex into a new project

```bash
cp -r ~/dotfiles/project-template/.codex <your-project>/.codex
```

After copying, customize:

- `<your-project>/.codex/AGENTS.md`
- `<your-project>/.codex/config.toml` from `config.toml.example` if you want hooks or project-local MCP
- `<your-project>/.codex/hooks/*.py` for repository policy
- `<your-project>/.codex/rules/default.rules`
- `<your-project>/.codex/skills/*/SKILL.md`

The template `.gitignore` already excludes local Codex runtime files such as session logs, caches, auth state, and SQLite state files.

## Standards For Good Codex Repositories

- Keep `AGENTS.md` short, clear, and repository-specific.
- Put reusable workflows into `skills/` instead of bloating `AGENTS.md`.
- Use `config.toml.example` to document optional hooks and MCP integrations without forcing mutable local state into version control.
- Use `rules/` only for durable safety or approval behavior.
- Avoid committing secrets, tokens, or user-specific auth artifacts.
- Do not symlink the entire `~/.codex/` home because it also stores runtime state.

## References

These structures were aligned with current Codex documentation and local Codex conventions:

- OpenAI Codex sample config: `https://developers.openai.com/codex/config-sample`
- OpenAI Codex `AGENTS.md` guide: `https://developers.openai.com/codex/guides/agents-md`
- OpenAI Codex rules: `https://developers.openai.com/codex/rules`
- OpenAI Codex hooks: `https://developers.openai.com/codex/hooks`
- OpenAI Codex MCP: `https://developers.openai.com/codex/mcp`
- OpenAI Codex skills: `https://developers.openai.com/codex/skills`
- OpenAI Codex plugin packaging: `https://developers.openai.com/codex/plugins/build`

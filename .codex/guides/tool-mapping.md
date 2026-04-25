# Copilot To Codex Mapping

These concepts are related, but they do not map 1:1.

## Core mapping

- Copilot `instructions/` -> Codex `AGENTS.md`
- Copilot `skills/` -> Codex `skills/`
- Copilot `hooks/` -> Codex hooks configured through `config.toml` or `hooks.json`
- Copilot `mcp-servers/` -> Codex `config.toml` MCP entries plus `mcp-servers/` documentation
- Copilot `plugins/` -> Codex plugin packaging guidance

## Concepts that differ

- Copilot `prompts/` do not have a direct Codex folder equivalent.
  Use small, focused Codex skills for repeatable workflows instead.
- Copilot `agents/` are usually represented in Codex through task phrasing, skill selection, and `AGENTS.md` guidance rather than a dedicated checked-in folder.
- Copilot editor settings live in `.vscode/`.
  Codex uses `~/.codex/config.toml` and optional project-local `.codex/config.toml`.

## Practical rule

When porting a good idea from `.github/` into `.codex/`, preserve the intent and use the Codex-native mechanism instead of copying the same folder structure blindly.

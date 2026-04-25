# Codex Project Template

This `.codex/` template is designed for repository-level Codex guidance.

## Included files

- `AGENTS.md` — project instructions Codex loads automatically
- `BOOTSTRAP.md` — post-copy setup checklist for real repositories
- `.gitignore` — keeps Codex local runtime state out of git
- `config.toml.example` — project-scoped Codex config example for hooks and MCP
- `hooks/` — repo-local hook scripts and standards
- `hooks/hooks.example.json` — alternative hook config format example
- `mcp-servers/` — MCP snippets and setup notes
- `rules/default.rules` — project-local safety and approval rules
- `skills/` — repository-specific Codex skills

Project-local `.codex/` rules load when the repository is trusted in Codex.

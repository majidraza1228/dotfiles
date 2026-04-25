# Codex MCP Server Standards

Use this folder to document approved MCP servers and keep reusable config snippets.

## Standards

- Keep one example snippet per server.
- Store secrets only in environment variables.
- Document minimum scopes and auth requirements.
- Prefer project-scoped MCP config only for repository-specific tools.
- Keep `config.toml` as the source of truth for active MCP configuration.

## Notes

- Codex stores MCP configuration in `config.toml`.
- Project-local MCP config can live in `<repo>/.codex/config.toml` for trusted repositories.
- Use `codex mcp add ...` for interactive setup or copy reviewed snippets into `config.toml`.

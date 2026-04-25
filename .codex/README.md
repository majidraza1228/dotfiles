# Codex Dotfiles Layout

Repository-level `.codex` structure for OpenAI Codex.

## Included files

- `AGENTS.md` — global Codex instructions and working agreements
- `BOOTSTRAP.md` — machine-level setup checklist for Codex
- `config.toml` — user-level Codex defaults
- `guides/` — cross-tool mapping and adoption notes
- `hooks/` — hook standards and lifecycle automation guidance
- `mcp-servers/` — MCP setup guidance and config snippets
- `rules/default.rules` — reusable approval and safety rules
- `skills/` — reusable Codex skills
- `plugins/` — plugin notes and packaging standards

These files are designed to map cleanly to the Codex home directory at `~/.codex/`.

## Maintenance

- Validate Codex assets in this repo with `bash scripts/validate_codex.sh`.
- Keep root `.codex/` as the standards library and `project-template/.codex/` as the copyable implementation.
- Avoid committing runtime artifacts such as `__pycache__/`, session logs, caches, auth files, or SQLite state.
- Review `guides/tool-mapping.md` when porting ideas from `.github/` into `.codex/`.

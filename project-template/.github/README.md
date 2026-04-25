# GitHub Copilot Structure

This `.github/` template is designed for VS Code + GitHub Copilot projects.

## Why this helps

You define behavior once (instructions, skills, agents, prompts, hooks) and reuse it across tasks, reducing prompt repetition and improving consistency.

In VS Code, open **Agent Customizations UI** (`chat customizations`) to inspect and evolve these files.

## Folders

- `instructions/` — shared standards and coding rules Copilot should follow
- `prompts/` — reusable prompt templates for common workflows
- `agents/` — role-based agent specs (reviewer, implementer, security)
- `skills/` — focused capabilities with clear trigger/use cases
- `hooks/` — pre/post automation scripts and safety checks
- `mcp-servers/` — MCP server configs and usage notes
- `plugins/` — plugin/extension standards and mappings

Each folder includes its own `README.md` with guidance and quality standards.

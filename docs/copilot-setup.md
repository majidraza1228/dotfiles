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

## `.vscode/` purpose

- `extensions.json` recommends Copilot-related extensions
- `settings.json` enables chat/inline behavior and points Copilot to `.github/copilot-instructions.md`

## MCP and secrets

Use environment variables for credentials (never commit live secrets).  
Example template: `.github/mcp-servers/github.mcp.json`.

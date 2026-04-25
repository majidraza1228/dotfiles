# dotfiles — Claude + GitHub Copilot + Codex Developer Setup

This repo provides a reusable developer structure for:

1. **Claude Code** (`.claude/` global + project template)
2. **GitHub Copilot in VS Code** (`.github/` + `.vscode/` project template)
3. **OpenAI Codex** (`.codex/` global + project template)

## Why this is helpful

This setup gives you one reusable agentic development system across tools:

1. **Claude** uses global and project `CLAUDE.md`, rules, commands, and hooks.
2. **Copilot** uses instructions, skills, agents, prompts, hooks, plugins, and workflows.
3. **Codex** uses `AGENTS.md`, skills, rules, hooks, MCP config, and plugins.

The goal is the same in each tool: persistent standards, reusable workflows, safer automation, and less prompt repetition.

## Tool mapping

- Copilot `instructions/` maps most closely to Codex `AGENTS.md`
- Copilot `skills/` maps to Codex `skills/`
- Copilot `hooks/` maps to Codex hooks configured through `config.toml` or `hooks.json`
- Copilot `mcp-servers/` maps to Codex MCP entries in `config.toml` plus `mcp-servers/` docs

More detail: `.codex/guides/tool-mapping.md`

## Quick install

```bash
git clone https://github.com/majidraza1228/dotfiles.git ~/dotfiles
cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

## What this repo contains

```text
dotfiles/
├── .codex/                     # Global Codex standards (AGENTS/rules/skills/hooks/MCP docs)
├── .claude/                    # Global Claude config (symlinked to ~/.claude)
├── project-template/.codex/    # Per-project Codex template
├── project-template/.claude/   # Per-project Claude template
├── project-template/.github/   # Per-project Copilot structure (instructions/prompts/agents/skills/hooks/mcp/plugins)
├── project-template/.vscode/   # VS Code Copilot defaults
├── .github/                    # Root Copilot best-practices library (reference + reusable examples)
└── install.sh
```

## Scaffold a new project

```bash
cp -r ~/dotfiles/project-template/.codex <your-project>/.codex
cp -r ~/dotfiles/project-template/.claude <your-project>/.claude
cp -r ~/dotfiles/project-template/.github <your-project>/.github
cp -r ~/dotfiles/project-template/.vscode <your-project>/.vscode
mv <your-project>/.claude/CLAUDE.example.md <your-project>/.claude/CLAUDE.md
```

## Detailed docs

- Codex setup/details: `docs/codex.md`
- Claude setup/details: `docs/claude-setup.md`
- Copilot setup/details: `docs/copilot-setup.md`
- Codex global bootstrap: `.codex/BOOTSTRAP.md`
- Codex project template internals: `project-template/.codex/README.md`
- Copilot template internals: `project-template/.github/README.md`
- Root Copilot reference library: `.github/README.md`

## Validation

Run the Codex structure check for this repo with:

```bash
bash scripts/validate_codex.sh
```

## Example Codex Repo Shape

```text
my-app/
├── .codex/
│   ├── AGENTS.md
│   ├── BOOTSTRAP.md
│   ├── config.toml
│   ├── hooks/
│   ├── mcp-servers/
│   ├── rules/
│   └── skills/
└── src/
```

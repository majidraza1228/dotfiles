# dotfiles — Claude + GitHub Copilot + Codex Developer Setup

This repo provides a reusable developer structure for:

1. **Claude Code** (`.claude/` global + project template)
2. **GitHub Copilot in VS Code** (`.github/` + `.vscode/` project template)
3. **OpenAI Codex** (`.codex/` global + project template)

## Quick install

```bash
git clone https://github.com/majidraza1228/dotfiles.git ~/dotfiles
cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

## What this repo contains

```text
dotfiles/
├── .codex/                     # Global Codex standards (linked/seeded into ~/.codex selectively)
├── .claude/                    # Global Claude config (symlinked to ~/.claude)
├── project-template/.codex/    # Per-project Codex template
├── project-template/.claude/   # Per-project Claude template
├── project-template/.github/   # Per-project Copilot structure (instructions/prompts/agents/skills/hooks/mcp/plugins)
├── project-template/.vscode/   # VS Code Copilot defaults
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

- Codex setup/details: `codex.md`
- Claude setup/details: `docs/claude-setup.md`
- Copilot setup/details: `docs/copilot-setup.md`
- Codex project template internals: `project-template/.codex/README.md`
- Copilot template internals: `project-template/.github/README.md`

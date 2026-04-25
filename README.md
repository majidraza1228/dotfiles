# dotfiles — Claude + GitHub Copilot Developer Setup

This repo provides a reusable developer structure for both:

1. **Claude Code** (`.claude/` global + project template)
2. **GitHub Copilot in VS Code** (`.github/` + `.vscode/` project template)

## Quick install

```bash
git clone https://github.com/majidraza1228/dotfiles.git ~/dotfiles
cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

## What this repo contains

```text
dotfiles/
├── .claude/                    # Global Claude config (symlinked to ~/.claude)
├── project-template/.claude/   # Per-project Claude template
├── project-template/.github/   # Per-project Copilot structure (instructions/prompts/agents/skills/hooks/mcp/plugins)
├── project-template/.vscode/   # VS Code Copilot defaults
└── install.sh
```

## Scaffold a new project

```bash
cp -r ~/dotfiles/project-template/.claude <your-project>/.claude
cp -r ~/dotfiles/project-template/.github <your-project>/.github
cp -r ~/dotfiles/project-template/.vscode <your-project>/.vscode
mv <your-project>/.claude/CLAUDE.example.md <your-project>/.claude/CLAUDE.md
```

## Detailed docs

- Claude setup/details: `docs/claude-setup.md`
- Copilot setup/details: `docs/copilot-setup.md`
- Copilot template internals: `project-template/.github/README.md`


# dotfiles

Personal Claude Code config. Restore on any machine in 30 seconds.

## Install

```bash
git clone https://github.com/majidraza1228/dotfiles.git ~/dotfiles
cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

## Structure

```
dotfiles/
├── install.sh                        # Symlinks everything into place
│
├── .claude/                          # Global Claude config (all projects)
│   ├── CLAUDE.md                     # Global brain — who you are, how Claude behaves
│   ├── settings.json                 # Global permissions + hooks
│   └── commands/
│       ├── review.md                 # /review — PR review workflow
│       └── fix-issue.md              # /fix-issue — GitHub issue → PR
│
└── project-template/                 # Blueprint for every new project
    └── .claude/
        ├── CLAUDE.md                 # Project brain (fill in per project)
        ├── settings.json             # Project permissions + hooks
        ├── rules/
        │   ├── code-style.md         # Naming, formatting, patterns
        │   ├── testing.md            # How to write and run tests
        │   └── api-design.md         # Endpoint conventions
        ├── commands/
        │   ├── review.md             # /review
        │   ├── fix-issue.md          # /fix-issue #123
        │   └── deploy.md             # /deploy
        ├── agents/
        │   ├── code-reviewer.md      # PR review agent
        │   └── security-auditor.md   # Security audit agent
        └── hooks/
            ├── pre-tool.sh           # Blocks dangerous commands
            └── post-edit.sh          # Auto-lints Python on save
```

## The 8-Layer Model

| Layer | File(s) | Purpose |
|-------|---------|---------|
| Brain | `CLAUDE.md` | Architecture, rules, standards |
| Connector | MCP servers in `settings.json` | GitHub, Slack, DBs |
| Control Panel | `settings.json` | Permissions + what Claude can/can't do |
| System Memory | `rules/*.md` | Modular, loaded only when needed |
| Automation | `commands/*.md` | One-line workflows (`/review`, `/deploy`) |
| Expertise | `~/.claude/skills/` | On-demand capabilities |
| Team | `agents/*.md` | Reviewer, auditor — each with its own role |
| Safety Net | `hooks/*.sh` | Block, lint, validate before/after tool use |

## Scaffold a new project

```bash
cp -r ~/dotfiles/project-template/.claude <your-project>/.claude
# Then fill in .claude/CLAUDE.md with your project's stack and context
```

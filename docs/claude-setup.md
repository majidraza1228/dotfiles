# Claude Setup Details

## Global vs project scope

- `~/.claude/` (from this repo's `.claude/`) is your **global** Claude behavior.
- `<project>/.claude/` (from `project-template/.claude/`) is **project-specific** and can override global defaults.

## Global files

- `.claude/CLAUDE.md` — identity, standards, communication defaults
- `.claude/settings.json` — allowed/blocked tools and hook wiring
- `.claude/commands/` — reusable slash-style workflows

## Project template files

- `CLAUDE.example.md` → rename to `CLAUDE.md`
- `rules/` — code style, testing, API design
- `commands/` — review/fix/deploy workflow templates
- `agents/` — role-driven review/security templates
- `hooks/` — pre/post automation scripts

## Install behavior

`install.sh` symlinks repo files into `~/.claude/` so updates in this dotfiles repo are reflected immediately.

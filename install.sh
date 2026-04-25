#!/bin/bash
# dotfiles install script
# Run this on any new machine to restore your Claude and Codex config

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

# Codex global config
mkdir -p ~/.codex/rules ~/.codex/skills
ln -sf "$DOTFILES_DIR/.codex/AGENTS.md" ~/.codex/AGENTS.md
cp -n "$DOTFILES_DIR/.codex/config.toml" ~/.codex/config.toml
cp -n "$DOTFILES_DIR/.codex/rules/default.rules" ~/.codex/rules/default.rules
ln -sfn "$DOTFILES_DIR/.codex/skills/fix-issue" ~/.codex/skills/fix-issue

echo "  linked ~/.codex/AGENTS.md"
echo "  seeded ~/.codex/config.toml if missing"
echo "  seeded ~/.codex/rules/default.rules if missing"
echo "  linked ~/.codex/skills/fix-issue"

# Claude Code global config
mkdir -p ~/.claude/commands
ln -sf "$DOTFILES_DIR/.claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$DOTFILES_DIR/.claude/settings.json" ~/.claude/settings.json
ln -sf "$DOTFILES_DIR/.claude/commands/review.md" ~/.claude/commands/review.md
ln -sf "$DOTFILES_DIR/.claude/commands/fix-issue.md" ~/.claude/commands/fix-issue.md

echo "  linked ~/.claude/CLAUDE.md"
echo "  linked ~/.claude/settings.json"
echo "  linked ~/.claude/commands/"

echo ""
echo "Done. To scaffold a new project:"
echo "  cp -r $DOTFILES_DIR/project-template/.codex <your-project>/.codex"
echo "  cp -r $DOTFILES_DIR/project-template/.claude <your-project>/.claude"

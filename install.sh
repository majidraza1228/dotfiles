#!/bin/bash
# dotfiles install script
# Run this on any new machine to restore your Claude config

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

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
echo "  cp -r $DOTFILES_DIR/project-template/.claude <your-project>/.claude"

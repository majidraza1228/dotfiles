#!/bin/bash
# dotfiles install script
# Run this on any new machine to restore your Claude config

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

# Claude Code global config
mkdir -p ~/.claude
ln -sf "$DOTFILES_DIR/.claude/CLAUDE.md" ~/.claude/CLAUDE.md
echo "  linked ~/.claude/CLAUDE.md"

echo "Done."

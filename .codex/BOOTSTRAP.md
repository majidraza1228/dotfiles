# Codex Global Bootstrap

Use this checklist when setting up Codex from this dotfiles repo on a new machine.

## 1. Install the global defaults

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

This links or seeds:

- `~/.codex/AGENTS.md`
- `~/.codex/config.toml`
- `~/.codex/rules/default.rules`
- `~/.codex/skills/fix-issue`

## 2. Review global model and personality

Open `~/.codex/config.toml` and confirm:

- default model
- personality
- multi-agent preference

Treat these as machine-level defaults, not project-specific policy.

## 3. Enable global MCP servers only when broadly useful

Use global MCP entries only for tools you want across many repositories.

Good candidates:

- documentation lookup
- GitHub access
- internal tools used across projects

Keep credentials in environment variables, not dotfiles.

## 4. Trust repositories intentionally

Codex project config and local automation should only be enabled for repositories you trust.

Use project-local `.codex/` config for:

- repo-specific hooks
- repo-specific MCP servers
- workflow skills tied to one codebase

## 5. Validate your dotfiles repo

Run:

```bash
bash scripts/validate_codex.sh
```

## 6. Scaffold project repos from the template

```bash
cp -r ~/dotfiles/project-template/.codex <your-project>/.codex
```

Then follow `project-template/.codex/BOOTSTRAP.md`.

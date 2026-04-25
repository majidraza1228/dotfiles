# Codex Bootstrap

Run these steps after copying `project-template/.codex` into a repository.

## 1. Set project instructions

Edit `AGENTS.md` and fill in:

- stack
- main entry points
- test command
- lint or format command
- repository-specific delivery constraints

## 2. Enable project config if needed

If you want Codex hooks or project-local MCP servers:

```bash
cp .codex/config.toml.example .codex/config.toml
```

Then review:

- hook commands in `.codex/config.toml`
- or use `.codex/hooks/hooks.example.json` if you prefer separate hook config
- enabled MCP servers
- model choice for the repository

## 3. Review hook policy

The included hooks are examples, not universal rules. Update them for your repo:

- `hooks/pre_tool_use_policy.py`
- `hooks/permission_request.py`
- `hooks/stop_require_verification.py`

## 4. Customize skills

Review and tailor:

- `skills/fix-issue/SKILL.md`
- `skills/code-review/SKILL.md`
- `skills/implement-feature/SKILL.md`
- `skills/security-review/SKILL.md`

Add repo-specific skills for repeated workflows instead of overloading `AGENTS.md`.

## 5. Configure MCP safely

- Keep tokens in environment variables.
- Document required scopes in `mcp-servers/`.
- Keep only reviewed MCP entries in `.codex/config.toml`.

## 6. Validate the setup

From the dotfiles repo, run:

```bash
bash scripts/validate_codex.sh
```

For downstream repos, at minimum verify:

- hook scripts exist and run
- `AGENTS.md` matches the repo
- local runtime files remain ignored

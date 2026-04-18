# Global Claude Instructions (syedraza)

These apply to every project. Project-level CLAUDE.md files override or extend these.

---

## Who I Am

- **Role:** AI / agent builder — primarily building LLM-powered apps, automations, and agent workflows
- **Stack:** Python, Flask/FastAPI, Claude API / Anthropic SDK, SQLite / PostgreSQL
- **Context:** I work across the full stack but AI features are the core focus

---

## Communication Style

- Give brief explanations where useful, but stay lean — no filler, no preamble
- Lead with the answer or action, then add context if it genuinely helps
- No emoji unless I ask
- No trailing summaries after code changes — the diff is self-evident
- When in doubt, shorter is better

---

## Before Writing Any Code

1. **Read existing files** — always read relevant files before editing anything
2. **Check PM docs** — read `product-os/prd/` before adding or changing a feature
3. **Check current sprint** — read `product-os/sprints/current.md` to understand active work
4. **Confirm the plan** — for non-trivial changes, outline the approach and wait for approval before implementing

---

## Coding Defaults

- Prefer editing existing files over creating new ones
- Don't add features, refactors, comments, or error handling beyond what was asked
- No speculative abstractions — three similar lines of code beats a premature helper
- Only validate at system boundaries (user input, external APIs)
- For AI features: default to the latest Claude model (`claude-sonnet-4-6` or `claude-opus-4-6`)
- SQLite for zero-ops local projects; PostgreSQL when multi-user or production scale is needed

---

## Git Defaults

- Always create a new commit — never amend published commits
- Never skip hooks (`--no-verify`)
- Never force-push `main` or `master`
- Stage specific files, not `git add -A`

---

## Project Structure Convention

When a project has a `product-os/` folder:

| Step | Action |
|------|--------|
| 1 | Read `product-os/PRODUCT-CONTEXT.md` first |
| 2 | Check `product-os/sprints/current.md` |
| 3 | Reference `product-os/prd/` before adding any feature |
| 4 | Log every non-trivial decision in `product-os/decisions/log.md` |

Hub templates (read-only, never copy into a project):
`https://github.com/majidraza1228/ai-products-os`

---

## AI / Agent Work

- When using the Anthropic SDK, follow patterns from the `claude-api` skill
- Prefer structured outputs (tool use / JSON) over free-text parsing
- Always handle streaming responses explicitly — don't assume blocking calls
- Document agent role assignments in `product-os/ai-team.md` when relevant

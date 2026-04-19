# Global Claude Instructions (syedraza)

These apply to every project. Project-level CLAUDE.md files override or extend these.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

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

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- Read relevant existing files — always read before editing anything
- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them — don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.
- Check PM docs (`product-os/prd/`) before adding or changing a feature
- Check current sprint (`product-os/sprints/current.md`) to understand active work
- For non-trivial changes, outline the approach and wait for approval before implementing

---

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked
- No abstractions for single-use code
- No "flexibility" or "configurability" that wasn't requested
- No error handling for impossible scenarios — only validate at system boundaries (user input, external APIs)
- Prefer editing existing files over creating new ones
- Three similar lines of code beats a premature helper

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

---

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting
- Don't refactor things that aren't broken
- Match existing style, even if you'd do it differently
- If you notice unrelated dead code, mention it — don't delete it

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused
- Don't remove pre-existing dead code unless asked

The test: every changed line should trace directly to the user's request.

---

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

---

## Coding Defaults

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

# [Project Name] — CLAUDE.md

> One-line description of what this project does.

## Stack

| Layer | Choice |
|-------|--------|
| Backend | Python + Flask |
| DB | SQLite / PostgreSQL |
| Frontend | Jinja2 + Vanilla JS |
| AI | Claude API (claude-sonnet-4-6) |

## Run Locally

```bash
pip install -r requirements.txt
python app.py
```

## Rules

@.claude/rules/code-style.md
@.claude/rules/testing.md
@.claude/rules/api-design.md

## PM Layer

| File | Purpose |
|------|---------|
| `product-os/PRODUCT-CONTEXT.md` | Read this first |
| `product-os/sprints/current.md` | Active sprint |
| `product-os/prd/` | Feature specs |
| `product-os/decisions/log.md` | Decision log |

## Before Writing Any Code

1. Read relevant existing files
2. Check `product-os/prd/` for the feature spec
3. Check `product-os/sprints/current.md`
4. Outline the plan — wait for approval on anything non-trivial

# /review

Review the current branch against main before merging.

## Steps

1. `git diff main...HEAD` — read every changed file
2. Load `.claude/rules/code-style.md` and `.claude/rules/api-design.md`
3. Check: does the code match the relevant PRD in `product-os/prd/`?
4. Report:

---

### What changed
One sentence.

### Issues (must fix)
- Bugs, broken contracts, missing validation, security holes

### Suggestions (optional)
- Only if genuinely valuable — don't pad

### Verdict
APPROVE / REQUEST CHANGES

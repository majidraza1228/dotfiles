# /review

Review the current branch diff against main.

## Steps

1. Run `git diff main...HEAD` to get all changes
2. Read every changed file in full before commenting
3. Check against `product-os/prd/` — does the code match what was specced?
4. Report in this format:

---

### Summary
One sentence on what this PR does.

### Issues (must fix)
- List blockers only — bugs, security holes, broken contracts

### Suggestions (optional)
- Style, naming, small improvements — only if genuinely valuable

### Verdict
APPROVE / REQUEST CHANGES

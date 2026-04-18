# /fix-issue

Fix a GitHub issue end-to-end.

## Usage
/fix-issue #<issue-number>

## Steps

1. `gh issue view <number>` — read the full issue
2. Read all files mentioned or likely affected
3. Confirm the fix is in `product-os/sprints/current.md` scope
4. Outline approach — wait for approval if non-trivial
5. Fix — prefer editing existing files
6. Commit: `fix: <description> (#<number>)`
7. `gh pr create` with a summary of what changed and why

# /fix-issue

Fix a GitHub issue end-to-end.

## Usage
/fix-issue #<issue-number>

## Steps

1. Run `gh issue view <number>` to read the full issue
2. Read all relevant files before touching anything
3. Check `product-os/sprints/current.md` — is this in scope?
4. Outline the fix and wait for approval if non-trivial
5. Implement — edit existing files, don't create new ones unless required
6. Write a focused commit message referencing the issue: `fix: <description> (#<number>)`
7. Push and create a PR with `gh pr create`

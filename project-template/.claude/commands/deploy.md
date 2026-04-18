# /deploy

Run pre-deploy checklist and push to production.

## Steps

1. Confirm you're on `main` and it's up to date: `git status`
2. Run tests: `pytest tests/ -v` — abort if any fail
3. Check for uncommitted changes — abort if any
4. Run the deploy command for this project (defined below)
5. Confirm the deploy succeeded by hitting the health endpoint

## Deploy Command

```bash
# Replace with your actual deploy command
# e.g. fly deploy / railway up / eb deploy
echo "Set your deploy command here"
```

## Post-Deploy Checks

- [ ] Health endpoint returns 200
- [ ] Spot-check one key user flow manually
- [ ] Check logs for errors in the first 2 minutes

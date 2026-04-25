#!/usr/bin/env python3
import json
import sys


VERIFICATION_MARKERS = (
    "test",
    "tests",
    "verified",
    "verification",
    "pytest",
    "npm test",
    "pnpm test",
    "ruff",
)


def main() -> int:
    try:
        payload = json.load(sys.stdin)
    except json.JSONDecodeError:
        return 0

    if payload.get("stop_hook_active"):
        return 0

    last_message = str(payload.get("last_assistant_message") or "").lower()
    if any(marker in last_message for marker in VERIFICATION_MARKERS):
        return 0

    json.dump(
        {
            "decision": "block",
            "reason": "Before finishing, summarize what you verified or explicitly state what you could not run.",
        },
        sys.stdout,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
import json
import re
import sys


BLOCK_PATTERNS = [
    (re.compile(r"\brm\s+-rf\b"), "Destructive recursive deletes are blocked by repository policy."),
    (re.compile(r"\bgit\s+push\b.*\s--force(?:\s|$)"), "Force-pushing is blocked by repository policy."),
    (re.compile(r"\bsudo\b"), "Commands using sudo are blocked by repository policy."),
]


def main() -> int:
    try:
        payload = json.load(sys.stdin)
    except json.JSONDecodeError:
        return 0

    command = str(payload.get("tool_input", {}).get("command", ""))
    for pattern, reason in BLOCK_PATTERNS:
        if pattern.search(command):
            json.dump({"decision": "block", "reason": reason}, sys.stdout)
            return 0
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

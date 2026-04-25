#!/usr/bin/env python3
import json
import re
import sys


DENY_PATTERNS = [
    (re.compile(r"\brm\s+-rf\b"), "Escalation denied: destructive recursive deletes are not allowed."),
    (re.compile(r"\bgit\s+push\b.*\s--force(?:\s|$)"), "Escalation denied: force-push is not allowed."),
]


def main() -> int:
    try:
        payload = json.load(sys.stdin)
    except json.JSONDecodeError:
        return 0

    command = str(payload.get("tool_input", {}).get("command", ""))
    for pattern, message in DENY_PATTERNS:
        if pattern.search(command):
            json.dump(
                {
                    "hookSpecificOutput": {
                        "hookEventName": "PermissionRequest",
                        "decision": {
                            "behavior": "deny",
                            "message": message,
                        },
                    }
                },
                sys.stdout,
            )
            return 0
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

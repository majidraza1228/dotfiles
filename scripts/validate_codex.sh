#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

fail() {
  echo "ERROR: $1" >&2
  exit 1
}

require_file() {
  local path="$1"
  [[ -f "$path" ]] || fail "Missing required file: $path"
}

require_dir() {
  local path="$1"
  [[ -d "$path" ]] || fail "Missing required directory: $path"
}

echo "Validating root .codex structure..."
require_file ".codex/AGENTS.md"
require_file ".codex/BOOTSTRAP.md"
require_file ".codex/README.md"
require_file ".codex/config.toml"
require_dir ".codex/guides"
require_dir ".codex/hooks"
require_dir ".codex/mcp-servers"
require_dir ".codex/rules"
require_dir ".codex/skills"

echo "Validating project-template/.codex structure..."
require_file "project-template/.codex/AGENTS.md"
require_file "project-template/.codex/README.md"
require_file "project-template/.codex/.gitignore"
require_file "project-template/.codex/config.toml.example"
require_dir "project-template/.codex/hooks"
require_dir "project-template/.codex/mcp-servers"
require_dir "project-template/.codex/rules"
require_dir "project-template/.codex/skills"

echo "Checking Codex skill folders..."
while IFS= read -r skill_dir; do
  require_file "$skill_dir/SKILL.md"
done < <(find .codex/skills project-template/.codex/skills -mindepth 1 -maxdepth 1 -type d | sort)

echo "Checking optional guide and hooks examples..."
require_file ".codex/guides/tool-mapping.md"
require_file "project-template/.codex/hooks/hooks.example.json"

echo "Checking referenced hook scripts..."
hook_paths="$(rg -o '\.codex/hooks/[A-Za-z0-9_./-]+' project-template/.codex/config.toml.example | sort -u || true)"
if [[ -z "$hook_paths" ]]; then
  fail "No hook paths were found in project-template/.codex/config.toml.example"
fi

while IFS= read -r hook_path; do
  [[ -n "$hook_path" ]] || continue
  require_file "project-template/$hook_path"
done <<< "$hook_paths"

echo "Compiling template hook scripts..."
python3 - <<'PY'
import os
import py_compile
import tempfile

hook_dir = "project-template/.codex/hooks"
for name in sorted(os.listdir(hook_dir)):
    if not name.endswith(".py"):
        continue
    path = os.path.join(hook_dir, name)
    fd, cfile = tempfile.mkstemp(suffix=".pyc")
    os.close(fd)
    try:
        py_compile.compile(path, cfile=cfile, doraise=True)
    finally:
        if os.path.exists(cfile):
            os.remove(cfile)
PY

echo "Checking for tracked local/runtime artifacts..."
forbidden_pattern='(^|/)(__pycache__/|.*\.pyc$|history\.jsonl$|session_index\.jsonl$|state_.*\.sqlite$|models_cache\.json$|auth\.json$|installation_id$|shell_snapshots/|cache/|tmp/|sessions/|log/)'
tracked_forbidden="$(git ls-files | rg "$forbidden_pattern" || true)"
if [[ -n "$tracked_forbidden" ]]; then
  echo "Forbidden tracked runtime artifacts:"
  echo "$tracked_forbidden"
  fail "Tracked runtime artifacts found in repository"
fi

echo "Checking docs mention current Codex validation assets..."
require_file "docs/codex.md"
rg -q 'config\.toml\.example' docs/codex.md || fail "docs/codex.md does not mention config.toml.example"
rg -q '\.codex/hooks/' docs/codex.md || fail "docs/codex.md does not mention .codex/hooks/"
rg -q 'BOOTSTRAP\.md' docs/codex.md || fail "docs/codex.md does not mention BOOTSTRAP.md"

echo "Codex validation passed."

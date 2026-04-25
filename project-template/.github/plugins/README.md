# Plugin Standards

## Purpose

Track VS Code plugins/extensions that support Copilot workflows.

## Why helpful

Standard plugin sets reduce environment drift and improve consistency across contributors.

## How to use

1. Keep required/optional lists in `vscode-plugins.json`.
2. Mirror key recommendations in `.vscode/extensions.json`.
3. Review and prune stale entries periodically.

## Standards

1. Separate required vs optional plugins.
2. Include rationale for each required plugin.
3. Pin major versions when compatibility matters.
4. Remove stale plugins during quarterly maintenance.
5. Keep plugin list aligned with `.vscode/extensions.json`.

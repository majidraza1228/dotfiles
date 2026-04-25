# MCP Server Standards

## Purpose

Define approved MCP integrations for Copilot-enabled workflows.

## Why helpful

MCP integrations let Copilot connect to external systems so workflow automation is end-to-end.

## How to use

1. Keep one server config per file.
2. Document auth and minimal required scopes.
3. Store secrets only in environment variables.

## Standards

1. One config file per server.
2. Name files as `<server>.mcp.json`.
3. Document auth method and minimum scopes.
4. Use least-privilege permissions.
5. Never commit live secrets; use environment variables only.

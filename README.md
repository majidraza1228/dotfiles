# dotfiles — Claude Code Developer Structure

Personal Claude Code config. Restore on any machine in 30 seconds.

> This repo is a complete blueprint for working with Claude Code professionally.
> Every layer has a specific job. Together they turn Claude from a chat tool into a reliable engineering teammate.

---

## Quick Install

```bash
git clone https://github.com/majidraza1228/dotfiles.git ~/dotfiles
cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

---

## Why This Structure Exists

Most developers use Claude Code by typing into a chat box. That works for one-off questions. It breaks down the moment you want Claude to:

- Follow your team's coding standards consistently
- Know what it's allowed to do vs. what it should never touch
- Run the same PR review workflow every time
- Understand the product context before touching the code
- Protect you from dangerous commands

This structure solves all of that. It is not just config files — it is how you give Claude a **professional working environment**, the same way you would onboard a new engineer.

---

## File Structure

```
dotfiles/
├── install.sh                        # Symlinks everything into place
│
├── .claude/                          # Global config — applies to every project
│   ├── CLAUDE.md                     # Your identity, standards, and defaults
│   ├── settings.json                 # Global permissions + hooks
│   └── commands/
│       ├── review.md                 # /review — PR review workflow
│       └── fix-issue.md              # /fix-issue — GitHub issue to PR
│
└── project-template/                 # Copy this into every new project
    └── .claude/
        ├── CLAUDE.example.md         # Rename to CLAUDE.md and fill in
        ├── settings.json             # Project permissions + hooks
        ├── rules/
        │   ├── code-style.md
        │   ├── testing.md
        │   └── api-design.md
        ├── commands/
        │   ├── review.md
        │   ├── fix-issue.md
        │   └── deploy.md
        ├── agents/
        │   ├── code-reviewer.md
        │   └── security-auditor.md
        └── hooks/
            ├── pre-tool.sh
            └── post-edit.sh
```

---

## Two .claude Folders — What Is the Difference?

This repo contains two `.claude` folders. They serve completely different purposes.

### `dotfiles/.claude/` — Your Global Config

This gets **symlinked into `~/.claude/`** on your machine by `install.sh`. It applies to every project, every session — no matter what folder you open Claude Code in.

```
.claude/
├── CLAUDE.md          # Who you are, your defaults, your style
├── settings.json      # Global permissions (what Claude can always run)
└── commands/
    ├── review.md      # /review — available in every project
    └── fix-issue.md   # /fix-issue — available in every project
```

Think of it as: **the rules that never change, regardless of project.**

---

### `dotfiles/project-template/.claude/` — A Blueprint You Copy

This is never symlinked. You copy it manually into each new project once:

```bash
cp -r ~/dotfiles/project-template/.claude <your-project>/.claude
```

It applies to **that one project only** and gets checked into that project's git repo.

```
project-template/.claude/
├── CLAUDE.example.md  # Rename to CLAUDE.md and fill in: stack, run commands, PM doc paths
├── settings.json      # Project-specific permissions + hooks
├── rules/             # Code style, testing, API design for this project
├── commands/          # /review, /fix-issue, /deploy
├── agents/            # Code reviewer, security auditor
└── hooks/             # pre-tool.sh, post-edit.sh
```

Think of it as: **a starting point you tailor per project.**

---

### How the Two Levels Load Together

When Claude Code opens a project it loads both — global first, then project on top:

```
~/.claude/CLAUDE.md           ← always loaded (your identity, defaults)
  +
<project>/.claude/CLAUDE.md   ← loaded on top (project overrides global)
```

Project-level settings win if there is a conflict. Your global CLAUDE.md can say "use SQLite by default" but a specific project's CLAUDE.md can say "this one uses PostgreSQL" — Claude follows the project rule.

| | `dotfiles/.claude/` | `project-template/.claude/` |
|---|---|---|
| Symlinked to | `~/.claude/` | Not symlinked — copied per project |
| Scope | Every project | One project only |
| Checked into | This dotfiles repo | The project's own repo |
| Changes needed | Rarely — your core identity | Yes — rename `CLAUDE.example.md` → `CLAUDE.md` and fill in |
| Example content | Communication style, git rules | Flask routes, SQLite config, sprint folder |

---

## The 8 Layers — What Each One Does and Why It Matters

### 1. CLAUDE.md — The Brain

**File:** `~/.claude/CLAUDE.md` (global) + `.claude/CLAUDE.md` (per project)

This is the first thing Claude reads in every session. It defines who you are, what stack you use, how you want Claude to communicate, and what it must do before writing any code.

**Without it:** Claude starts every session with no memory of your preferences, your stack, or your standards. You repeat yourself constantly.

**With it:** Claude behaves like a teammate who already knows the codebase, the product, and your working style before the first message.

Two levels:
- **Global** (`~/.claude/CLAUDE.md`) — your identity, communication style, git rules, coding defaults. Applies everywhere.
- **Project** (`.claude/CLAUDE.md`) — stack, run commands, PM doc locations. Overrides the global for that project.

---

### 2. settings.json — The Control Panel

**File:** `~/.claude/settings.json` (global) + `.claude/settings.json` (per project)

This is where you define what Claude is allowed to do. It has three jobs:

1. **Allow list** — commands Claude can run without asking (e.g. `git`, `python3`, `gh`)
2. **Deny list** — commands Claude must never run (e.g. `rm -rf`, `sudo`, `git push --force`)
3. **Hooks** — scripts that run automatically before or after Claude uses a tool

**Without it:** Claude asks for permission on every command, or you blindly approve everything.

**With it:** Routine commands run without friction. Dangerous ones are blocked before they can execute.

---

### 3. rules/ — The System Memory

**Files:** `.claude/rules/code-style.md`, `rules/testing.md`, `rules/api-design.md`

Instead of one massive CLAUDE.md that tries to cover everything, rules are modular. Each file covers one concern. Claude loads the relevant rule file when the task requires it.

**Without it:** Claude writes code that looks different every session — different naming conventions, different patterns, inconsistent API design.

**With it:** Claude applies your standards automatically. A new endpoint always follows your URL conventions. A new test always follows your testing structure. The codebase stays consistent even across many sessions.

**Best practice:** Keep each rules file focused on one topic. Add a new file when a new concern grows large enough to deserve its own space.

---

### 4. commands/ — The Automation Layer

**Files:** `.claude/commands/review.md`, `commands/fix-issue.md`, `commands/deploy.md`

Custom slash commands that encode your workflows. Instead of explaining the same process every time, you write it once and call it with one line.

```
/review
/fix-issue #47
/deploy
```

**Without it:** Every PR review is ad-hoc. You re-explain the format every time. Steps get skipped.

**With it:** `/review` always runs the same checklist, checks the PRD, and returns the same structured output. The workflow is repeatable and trustworthy.

**Best practice:** Write a command for any workflow you run more than twice. The command file is just Markdown — write it like instructions to a smart colleague.

---

### 5. agents/ — Your AI Team

**Files:** `.claude/agents/code-reviewer.md`, `agents/security-auditor.md`

Agent definitions give Claude a specific role, mindset, and set of tools for a focused task. Instead of asking Claude to "review my code," you invoke an agent that has a defined perspective, a checklist, and a fixed output format.

**Without it:** Code review is inconsistent. Security checks only happen when you remember to ask.

**With it:** The code reviewer always checks against your PRDs and style rules. The security auditor always runs the same vulnerability checklist. Each agent is a specialist, not a generalist.

**Best practice:** One agent per role. Keep the scope narrow. A focused agent with a clear output format is more reliable than a broad one.

---

### 6. hooks/ — The Safety Net

**Files:** `.claude/hooks/pre-tool.sh`, `hooks/post-edit.sh`

Shell scripts that run automatically before or after Claude uses a tool. Pre-tool hooks can block dangerous commands entirely. Post-edit hooks can lint, validate, or log after every file change.

**Without it:** Claude can execute a destructive command before you have a chance to stop it. There is no automatic quality check after edits.

**With it:**
- `pre-tool.sh` blocks `rm -rf`, `DROP TABLE`, `DELETE FROM` without `WHERE`, and force pushes — before they run
- `post-edit.sh` runs `flake8` on every Python file Claude edits, catching style errors immediately

**Best practice:** Keep hooks fast and focused. A hook that takes more than 1-2 seconds will slow down every tool call. Block the genuinely dangerous things. Auto-fix what can be auto-fixed.

---

### 7. skills/ — On-Demand Expertise

**Location:** `~/.claude/skills/`

Skills are reusable capabilities Claude can load when a task requires them. Instead of loading every capability in every session, Claude pulls in a skill only when it is relevant.

**Without it:** You either over-brief Claude with context it does not need, or you forget to include context it does.

**With it:** Claude loads the right knowledge for the right task. A data analysis skill loads when you are working with data. An API integration skill loads when you are calling an external service.

---

### 8. MCP Servers — The Connector

**Configured in:** `settings.json` under `mcpServers`

MCP (Model Context Protocol) servers are how Claude connects to external tools and services. GitHub, Slack, databases, Jira — without MCP, Claude can only talk. With MCP, Claude can act.

**Without it:** Claude can read your code but cannot open issues, send messages, query your database, or interact with any external system.

**With it:** Claude becomes an agent that operates across your entire toolchain. It can read a GitHub issue, write the fix, open a PR, and post the link to Slack — all in one session.

---

## How the Layers Work Together

Here is what happens when you run `/fix-issue #47`:

1. Claude reads **CLAUDE.md** — it knows the stack, the PM docs, and how you work
2. It checks **settings.json** — it knows what commands it is allowed to run
3. It loads **commands/fix-issue.md** — it knows the exact workflow to follow
4. It reads the relevant **rules/** files for the code it is about to write
5. Every Bash command passes through **hooks/pre-tool.sh** — dangerous commands are blocked
6. Every file it edits triggers **hooks/post-edit.sh** — Python files are linted automatically
7. If it needs to open a PR or post to Slack, it uses **MCP** to take action

No re-explaining. No ad-hoc decisions. A consistent, safe, repeatable workflow every time.

---

## Scaffold a New Project

```bash
# 1. Copy the template into your project
cp -r ~/dotfiles/project-template/.claude <your-project>/.claude

# 2. Rename the example file — this is your project brain
mv <your-project>/.claude/CLAUDE.example.md <your-project>/.claude/CLAUDE.md
```

Then open `.claude/CLAUDE.md` and fill in every placeholder:

| Placeholder | Replace with |
|-------------|-------------|
| `[Project Name]` | Your actual project name |
| `Backend / DB / Frontend / AI` rows | Your real stack choices |
| Run Locally commands | Your actual install + start commands |
| PM Layer paths | Where your PRDs and sprint files live |

Everything else (rules, commands, agents, hooks) works out of the box — no changes needed until you have project-specific needs.

> `CLAUDE.example.md` is intentionally named so you cannot accidentally use it as-is. Claude only reads `CLAUDE.md` — the rename is required.

---

## Restore on a New Machine

```bash
git clone https://github.com/majidraza1228/dotfiles.git ~/dotfiles
cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

The install script symlinks every global file into `~/.claude/` so changes to the repo are reflected immediately — no re-copying needed.

---

## Best Practices Adopted

Reviewed against [Claude Code official docs](https://code.claude.com/docs/en/best-practices), [shanraisshan/claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice), and community patterns. Here is what was adopted and why.

| # | Practice | Adopted | Reason |
|---|----------|---------|--------|
| 1 | **YAML frontmatter in agent files** (`name`, `description`, `tools`, `model`) | Yes | Claude uses the `description` field to decide when to auto-invoke an agent. Without it, agents are passive and must be called manually every time |
| 2 | **YAML frontmatter in skill files** (`name`, `description`, `paths`) | Yes | Same reason — the `description` drives auto-discovery. The `paths` field activates a skill only for matching files, keeping context lean |
| 3 | **`$schema` in settings.json** | Yes | Enables IDE autocompletion and validation on all 60+ settings fields. Free quality check, no cost |
| 4 | **`settings.local.json` + `.gitignore`** | Yes | Personal overrides (extra allow rules, personal tokens) stay off git. Team-shared settings stay in `settings.json`. Both files merge — local wins on conflict |
| 5 | **`@path/to/file` imports in CLAUDE.md** | Yes | Rules files stay modular and focused. CLAUDE.md stays under 200 lines. Claude only loads the rule content when it is actually needed |
| 6 | **`Stop` and `PreCompact` hook events** | Yes | `Stop` logs when a session ends — useful for auditing. `PreCompact` fires before Claude compresses context — a good place to checkpoint state |
| 7 | **Keep CLAUDE.md under 200 lines** | Already met | Files over 200 lines cause Claude to start ignoring rules buried near the bottom. If a rule keeps getting missed, the file is probably too long |
| 8 | **Separate git commit per file** | Skipped | Conflicts with our workflow. We commit logical units of change, not file-by-file |

### Key things to know about agent frontmatter

```yaml
---
name: code-reviewer           # How you invoke it
description: Reviews PRs...   # Claude reads this to decide when to auto-invoke
tools: Read, Bash, Glob       # Restrict to only what the agent needs
model: sonnet                 # haiku for fast/cheap, sonnet for quality, opus for complex
permissionMode: plan          # plan = shows actions before running (good for auditors)
---
```

### Key things to know about settings layers

```
managed-settings.json         ← org-enforced, cannot be overridden
  └── .claude/settings.json   ← team-shared, committed to git
        └── settings.local.json ← personal, git-ignored, wins on conflict
```

Never put secrets or personal tokens in `settings.json`. Use `settings.local.json` instead.

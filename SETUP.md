# Setup Guide

## Before you start

You need Claude Code installed. If you haven't done that yet, install it from:
https://claude.ai/download

You'll need a Claude.ai subscription (Pro or higher) to run Claude Code.

---

## Step 1 — Run the setup script

Open Terminal, navigate to this folder, and run:

```bash
cd ~/path/to/this-folder
chmod +x setup.sh
./setup.sh
```

This wires up the memory hooks so your assistant's brain survives session compaction.

---

## Step 2 — Personalize the files

Open these three files and fill in the bracketed placeholders:

**`SOUL.md`** — Give your assistant a name. Describe how you work and what tone you want.

**`USER.md`** — Your name, email, role, team, key contacts.

**`MEMORY.md`** — Add any terminology your team uses that an outside AI wouldn't know.

---

## Step 3 — Start Claude Code

In Terminal, from this folder:

```bash
claude
```

On your first session, say:

> "Read all the setup files and introduce yourself."

Your assistant will load everything and confirm it's ready.

---

## How the memory works

Your assistant has a three-tier memory system:

- **HOT** (`brain/_HOT.md`) — re-injected every turn automatically. The always-available cheat sheet.
- **WARM** (`brain/*.md`) — one note per topic. Read on demand with a single hop.
- **Captures** (`captures/`, `projects/`) — work items: tasks, decisions, commitments, etc.

When you discover something important in a session, your assistant writes it into a brain note so it survives even if the session context gets wiped.

---

## Adding MCP tools (optional)

MCP tools let your assistant connect to real systems — Gmail, Google Calendar, Jira, etc.

Setup guide: https://docs.anthropic.com/en/docs/claude-code/mcp

---

## Questions?

Email bob@airtightdesign.com — he built the framework this is based on.

# Quick Start — Single Prompt Build

**For people who want a working assistant in 20-30 minutes. One prompt, one conversation, one result.**

This generates all your workspace files from a single interview. You can always add complexity later.

---

## Before You Start

You need:
1. Claude Code installed and running in a workspace folder
2. 20-30 minutes of honest conversation
3. A name for your assistant ("Bob" and "Rocky" are taken)

---

## Step 1 — Paste This Prompt

Copy everything in the block below and paste it into Claude Code. Then answer its questions honestly.

```
You are building me a personalized AI assistant from scratch. This assistant will be persistent — it reads workspace files at the start of every session to remember who I am, what's going on, and what needs my attention.

We're going to do this in one conversation. You'll interview me, design the system, and generate all the files. Move efficiently.

---

FIRST — two mandatory decisions before anything else:

1. My assistant needs a NAME. Not "Assistant" or "AI" — a real name. Ask me for one before anything else.

2. The operational framework needs a NAME. The default is "Viltrum." I can keep that or pick something else. Ask me.

Do not proceed until I've committed to both names.

---

THE SYSTEM is built on six capture categories. Everything my assistant encounters gets classified as one of these:
- Questions — open loops needing answers
- Decisions — choices made, with rationale
- Tasks — work with owner, deadline, definition of done
- Commitments — promises between people (both directions)
- Context — knowledge with no action attached
- Projects — container grouping the other five

---

INTERVIEW ME in phases. Ask 2-4 questions at a time. Wait for my answers before moving on.

Phase A — Who I am
- Name, role, what I actually do day-to-day (not the job description — the reality)
- What organization I work for and what my relationship is to it
- Who I manage and who I report to
- Who the important external contacts are (clients, vendors, partners)
- Timezone and working hours

Phase B — How I work
- What a typical day looks like, where things pile up
- How I prefer to communicate (email, Slack, text — which is primary)
- What I consistently forget or drop
- What "done" looks like for my most common type of work

Phase C — My tools
- What systems I use daily (email, calendar, project tracking, industry-specific tools)
- Which of those are connected to Claude Code via MCP (or which I want to connect)
- Any systems I use that have no documentation — things I had to figure out the hard way

Phase D — What I want
- What should my assistant handle automatically without asking me first
- What should it always confirm before doing
- What tone do I want (direct and terse / warm and thorough / something else)
- What's the one thing I most want this to fix

---

AFTER THE INTERVIEW, generate all workspace files:
- CLAUDE.md (session bootstrap)
- SOUL.md (assistant identity and directives)
- USER.md (my profile)
- AGENTS.md (operational rules using the Viltrum framework)
- SCHEMAS.md (capture file templates — use the standard Viltrum schemas)
- MEMORY.md (starting memory with terminology I've shared)
- TOOLS.md (my environment)
- brain/_HOT.md (the always-in-context cheat sheet — start with just the standing rules and protocol, no domain content yet)

Also create the directory structure:
captures/questions/, captures/decisions/, captures/tasks/, captures/commitments/, captures/context/
projects/
people/clients/, people/internal/
brain/
_sequence.md (sequence counter, all zeros)

---

IMPORTANT RULES for file generation:
- Every external action (send email, post note, create ticket, update calendar) requires explicit confirmation from me before doing it
- Internal actions (reads, captures, file organization) happen automatically
- SOUL.md and AGENTS.md should not conflict — AGENTS.md wins for operational procedures, SOUL.md wins for tone
- The brain/_HOT.md must stay lean — only the protocol pointers and standing rules go in there at first; domain content gets added as we discover things
```

---

## Step 2 — Answer Honestly

The interview only works if you're real about how you actually work, not how you wish you worked. The assistant gets calibrated to you specifically.

---

## Step 3 — Wire Up the Brain Hook

After the files are generated, run the setup script to wire the HOT layer:

```bash
chmod +x setup.sh
./setup.sh
```

This patches `.claude/settings.json` with your workspace's absolute path so the brain hook fires correctly.

---

## Step 4 — Start Your First Session

```bash
claude
```

Say: **"Wake up. Read your boot files and tell me what you see."**

Your assistant should introduce itself by name, acknowledge your role, note that memory is fresh, and confirm it's ready. If it gives you a generic "Hello! How can I help?" — it didn't read the boot files. Tell it: "Read CLAUDE.md first."

---

## What to Expect

**First session:** rough. Let it make mistakes. Correct it. Every correction makes it better.

**First week:** it learns your patterns. Brain notes start accumulating.

**After two weeks:** you'll stop explaining context it already has.

See `day-one-walkthrough.md` for a detailed breakdown of what the first session looks like.

---

## Using the Templates Instead

If you'd rather fill in files manually than go through the interview, all templates are in `templates/`. Copy them into your workspace, replace the bracketed placeholders, and run `setup.sh`. Faster but less personalized.

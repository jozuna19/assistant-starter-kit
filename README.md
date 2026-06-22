# Viltrum Starter Kit

**Build a persistent AI assistant with memory that survives sessions — tailored to your role, your tools, and how you actually work.**

Built on top of the [Bob Builder Kit](https://github.com/airtight-design/atd-bob-builder-kit) by Airtight Design. This kit extends the core framework with a **brain vault system**: a structured memory layer that re-injects critical knowledge into every session automatically, so your assistant never forgets something you've already taught it.

---

## What You're Building

A personal AI assistant that:

- **Remembers** — a three-tier memory system keeps knowledge alive across session compaction and restarts
- **Classifies** — everything gets run through six capture categories so nothing falls through the cracks
- **Guards** — built-in rules about when to act vs. when to confirm, so your assistant never sends, posts, or files anything without your approval
- **Improves** — every new discovery gets compiled into the brain, making your assistant smarter over time

This is not a chatbot. It's an operational system.

---

## The Brain Vault (what this kit adds)

Standard AI assistants forget between sessions. Claude Code "compacts" when context fills up — it summarizes and drops the detail. The brain vault fixes this.

**Three tiers:**

- **HOT** (`brain/_HOT.md`) — re-injected into every session automatically via hooks. The cheat sheet. Always in context with zero cost to retrieve.
- **WARM** (`brain/*.md`) — one note per topic. Reached in a single targeted read when needed.
- **Cold** — raw captures and archives. Deep digs only.

**The rule:** HOT (already in context) → at most ONE warm read → answer. Never scan the whole vault.

**The mechanism:** `.claude/settings.json` hooks run `cat brain/_HOT.md` on every session start and every prompt — including after compaction. Your assistant's core knowledge is re-stapled to the front of context every single turn.

See `architecture.md` for the full technical breakdown.

---

## Who This Is For

Anyone who uses Claude Code and wants their assistant to actually remember things. You don't need to be technical. The framework adapts to:

- **CSMs and account managers** tracking client commitments, camera health, billing issues, and service escalations
- **Field services teams** building SOPs, tracking installs, and managing site-specific procedures
- **Project managers** tracking deliverables, blockers, and stakeholder decisions
- **Engineers** tracking technical discoveries, system gotchas, and design decisions
- **Operations roles** where undocumented process knowledge keeps getting lost

The brain vault is especially useful when your work involves systems with no public documentation — things you had to figure out the hard way. Once you write a brain note, your assistant knows it forever.

---

## How to Get Started

**Option A — Quick Start (20-30 minutes)**

One prompt, one conversation, one result. See `quick-start.md`.

**Option B — Manual Assembly**

Fill in the templates in `templates/` directly, run `setup.sh`, and you're live. Good if you already know what you want and just need the scaffolding.

---

## Repo Structure

```
README.md                 This file
quick-start.md            One-prompt build path (start here)
day-one-walkthrough.md    What your first session looks like
architecture.md           How the brain vault works (technical reference)
setup.sh                  Wires up the HOT hook to your workspace path
templates/
  CLAUDE.template.md      Assistant bootstrap — the session loader
  SOUL.template.md        Who your assistant is
  USER.template.md        Who you are
  AGENTS.template.md      How your assistant operates (the Viltrum rules)
  SCHEMAS.template.md     Capture file templates
  MEMORY.template.md      Long-term memory index
  TOOLS.template.md       Your environment and integrations
  brain/
    _HOT.template.md      The always-in-context cheat sheet
    _PROTOCOL.md          Memory read/write/verify rules
    _SYSTEM.template.md   How the brain system itself works
```

---

## Principles

1. **Act, don't ask** — for internal organization (reading, capturing, filing). Confirm before external actions (sending, posting, filing tickets).
2. **Capture by default** — easier to close a capture than reconstruct one you missed.
3. **Compile, don't transcribe** — brain notes store conclusions, not conversations.
4. **Memory is files** — your assistant wakes up fresh every session. Its workspace IS its memory.
5. **Exact strings live in HOT** — concepts survive compaction in the hot layer. Critical exact strings (URLs, IDs, field names) must also be in HOT or your assistant will hallucinate them after a compaction.
6. **Verify before acting** — anything named in a brain note gets confirmed against live state before you act on it.
7. **Surface problems** — a good assistant tells you what's going wrong, not just what you asked about.

---

## When You Get Stuck

The core framework was built by Airtight Design. Email **bob@airtightdesign.com** for questions about the Viltrum framework, classification edge cases, or anything that feels broken.

---

_Extended from the [Bob Builder Kit](https://github.com/airtight-design/atd-bob-builder-kit) by Airtight Design._

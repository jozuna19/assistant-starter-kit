# Brain Vault Add-On

**A memory extension for the [Bob Builder Kit](https://github.com/airtight-design/atd-bob-builder-kit).**

Start with the Bob Builder Kit to build your assistant. Then drop this in to add a brain vault — a structured memory layer that re-injects critical knowledge into every session automatically, so your assistant never forgets something you've already taught it.

---

## The Problem This Solves

Claude Code compacts when context fills up. It summarizes and drops detail. Things you taught your assistant last week — process gotchas, system quirks, exact strings — get mangled or lost.

The brain vault fixes this by re-injecting a curated "cheat sheet" (`brain/_HOT.md`) into every session, every prompt, and every compaction automatically via a settings hook.

---

## What's in This Repo

```
brain/
  _HOT.template.md     The always-in-context cheat sheet (fill this in over time)
  _PROTOCOL.md         Rules for reading, writing, and maintaining the brain
  _SYSTEM.template.md  How the whole system works (read this first)
setup.sh               Wires the hook to your workspace path
```

---

## How to Add This to Your Bob Builder Workspace

**1. Copy the brain folder into your workspace**

```bash
cp -r brain/ ~/path/to/your-workspace/brain/
```

**2. Rename the template files**

```bash
mv brain/_HOT.template.md brain/_HOT.md
mv brain/_SYSTEM.template.md brain/_SYSTEM.md
```

**3. Run the setup script from your workspace**

```bash
cd ~/path/to/your-workspace
bash ~/path/to/this-repo/setup.sh
```

This writes `.claude/settings.json` with hooks that re-inject `brain/_HOT.md` on every session start and every prompt.

**4. Add the brain to your CLAUDE.md**

Add this line to your `CLAUDE.md` after the other `@` imports:

```
@brain/_HOT.md
```

And add this section:

```markdown
## Brain (persistent memory across compaction)

`brain/` is the curated knowledge vault. `@brain/_HOT.md` is auto-loaded every session.
For anything deeper, read the ONE relevant `brain/<Note>.md`. Full rules → `brain/_PROTOCOL.md`.
```

---

## How It Works

Three tiers:

- **HOT** (`brain/_HOT.md`) — re-injected every turn via hook. Always in context. The cheat sheet.
- **WARM** (`brain/*.md`) — one note per topic. Reached in a single targeted read.
- **Cold** — captures, archives. Deep digs only.

**The rule:** answer from HOT first → at most ONE warm read → respond. Never scan the vault.

**The key insight:** critical exact strings (URLs, IDs, field names, endpoint paths) must live in HOT — not just WARM. After a compaction, your assistant will confidently hallucinate a wrong path it learned from a summary. If the string being wrong causes a real error, it belongs in HOT.

Read `brain/_SYSTEM.md` for the full breakdown.

---

## Building Your Brain Over Time

Start with `_HOT.md` mostly empty — just the protocol pointers and standing rules. Add to it as you work:

- Discover an undocumented system behavior → write a brain note, promote the one-liner to HOT
- Figure out a multi-step process → write a brain note
- Hit a gotcha that wasted time → write a brain note with the fix

Your brain grows with your experience. After a few weeks it becomes a genuine institutional knowledge base that survives every session restart.

---

_Built on top of the [Bob Builder Kit](https://github.com/airtight-design/atd-bob-builder-kit) by Airtight Design._

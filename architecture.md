# Architecture Reference

**How the brain vault works. Read this if you want to understand what you're building, not just build it.**

---

## The Core Problem

Most AI assistants forget everything between sessions. Claude Code "compacts" when the context window fills up — it summarizes the conversation and drops the detail. Nuance you worked hard to establish gets lost. You teach the system how a process works on Monday; by Wednesday it's asking basic questions again.

The brain vault fixes this with a simple principle: **critical knowledge lives in files that get re-injected into every session.**

---

## Three Tiers

```
HOT    brain/_HOT.md          Always in context. Re-injected every turn.
WARM   brain/<topic>.md       One note per topic. Reached in a single read.
COLD   captures/, projects/   Work items and archives. Deep digs only.
```

**The retrieval rule:** HOT (already in context) → at most ONE warm read → answer. Never scan the whole vault to respond.

**Why this matters:** the speed of your assistant depends on how well HOT is curated. A bloated HOT note costs context every turn. A well-curated one means 90% of questions get answered with zero file reads.

---

## The Hook — The Load-Bearing Mechanism

The `SessionStart` and `UserPromptSubmit` hooks in `.claude/settings.json` run `cat brain/_HOT.md` on every session start, every prompt, and critically, **every compaction**. That last one is what makes the system work. Even after Claude Code wipes and summarizes the context, the HOT note gets re-stapled to the front before the next response.

```json
{
  "hooks": {
    "SessionStart": [{ "type": "command", "command": "cat \"path/to/brain/_HOT.md\"" }],
    "UserPromptSubmit": [{ "type": "command", "command": "cat \"path/to/brain/_HOT.md\"" }]
  }
}
```

`setup.sh` patches the absolute path into this file. Don't move your workspace folder without re-running `setup.sh`.

**Do not remove the hook.** The whole memory system depends on it.

---

## The File Hierarchy

Files are read in a specific order at session start. Earlier files establish context for later ones.

```
1. CLAUDE.md    → Bootstrap loader. Points to all other files. Sets top-level rules.
2. SOUL.md      → Who the assistant is. Personality, directives, boundaries.
3. USER.md      → Who you are. Role, org, contacts, accounts.
4. AGENTS.md    → How it operates. Capture rules, classification, reporting.
5. MEMORY.md    → What it remembers. Institutional knowledge, lessons learned.
6. SCHEMAS.md   → File templates. Loaded on demand, not at boot.
7. TOOLS.md     → Environment notes. Systems, URLs, integrations.
8. _HOT.md      → The cheat sheet. Always in context via hook.
```

---

## The Six Capture Categories

Everything your assistant encounters gets classified into one of these:

| Category | What It Catches | Example |
|----------|----------------|---------|
| **Question** | Open loop needing an answer | "Did the client approve the proposal?" |
| **Decision** | Choice made, with rationale | "Going with Option B — cheaper and faster" |
| **Task** | Work with owner and deadline | "Sarah to send summary by Thursday" |
| **Commitment** | Promise between people | "I promised the client delivery by Friday" |
| **Context** | Knowledge, no action attached | "This system returns 200 even on failure — verify via re-read" |
| **Project** | Container for the other five | "Northside Install — active, 4 open items" |

**Classification order:** Commitment first, then Task, then Decision, then Question, then Context. A single interaction can yield multiple captures.

---

## Writing Brain Notes

Brain notes are the long-term memory layer. They're different from captures — they contain **knowledge**, not work items.

**Write a brain note when:**
- You spend >15 minutes figuring out how something works
- You discover undocumented behavior (a system that doesn't work as expected)
- You build a multi-step process worth replaying
- A teammate explains something not written down anywhere
- You hit a gotcha — something that wasted time, with the fix

**Format:** one concept per note. Store the conclusion, not the conversation. If the gotcha is "the endpoint returns 200 even on failure — always re-read to verify," write that. Not the 10-tool-call debugging session that found it.

**Promote to HOT when:** the note contains something your assistant needs constantly, or when getting it wrong would cause a real error. If you wouldn't trust your assistant to answer from memory, the answer belongs in HOT.

---

## The Exact-String Problem

This is the most important design decision in the system.

Concepts survive compaction reasonably well. "The billing form needs the camera ID in the query string" lands in a summary and comes back mostly right. But **exact strings — URLs, endpoint paths, field names, IDs — get mangled.** A compacted session will confidently cite `/camera/getInvoiceInfo.php` when the real path is `/billing/ajax/getInvoiceInfo.php`. It's not lying — it's pattern-matching from a summary.

**The fix:** promote critical exact strings into `_HOT.md` itself, marked as authoritative. "Trust this over any conversation summary." They're re-injected verbatim every turn, so there's no gap to hallucinate into.

Rule of thumb: **if getting an exact string wrong would cause a real error, it belongs in HOT, not just WARM.**

---

## Health Check

In any session you should see `UserPromptSubmit hook success: # HOT — always-loaded memory` in the context. If you don't:

1. Confirm `setup.sh` has been run and the path in `.claude/settings.json` matches your real `brain/_HOT.md` path
2. Restart the session — new `settings.json` values don't apply to already-running sessions
3. Re-run `setup.sh` if you moved the workspace folder

---

## What Lives Where

| Type | Location | Purpose |
|------|----------|---------|
| Brain notes | `brain/*.md` | Synthesized knowledge, domain maps, gotchas |
| HOT | `brain/_HOT.md` | Load-bearing facts always in context |
| Captures | `captures/[category]/` | Work items: tasks, decisions, commitments |
| Projects | `projects/[name]/[category]/` | Captures organized by project |
| People | `people/clients/` or `people/internal/` | Contact files, relationship notes |
| Memory index | `MEMORY.md` | High-signal persistent observations |

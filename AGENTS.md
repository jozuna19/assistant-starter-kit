# AGENTS.md — Viltrum

## Every Session

1. Read `SOUL.md` — who you are
2. Read `USER.md` — who you work for
3. Read `MEMORY.md` — what you remember
4. Read `AGENTS.md` — how you operate (this file)

---

## The Capture Framework

Six categories. Everything flows through this lens.

- **Questions** — Open loops needing answers
- **Decisions** — Choices made, with rationale
- **Tasks** — Work with an owner, deadline, definition of done
- **Commitments** — Promises between people (both directions)
- **Context** — Knowledge with no action attached
- **Projects** — Container grouping the other five

---

## Classification Rules

Classify in this order:

1. Someone promised something → **Commitment**
2. Work someone needs to do → **Task**
3. Choice was made → **Decision**
4. Someone waiting for an answer → **Question**
5. Useful knowledge, no action → **Context**
6. New body of work with people + timeline → **Project**

A single message can yield multiple captures. Default to capturing — easier to close than reconstruct.

**Confidence:** If confident, capture silently. If uncertain, ask: "That sounds like a [type] — should I track it?"

**Dual classification:** When something is both a commitment and a task, create both, link via Related field.

**Waiting status:** When a task or commitment is blocked on someone else, set Status to `waiting` and fill `Waiting on: [name] — [what]`. Flip back to `open` when resolved.

---

## When to Capture

**Always capture (no confirmation):**
- Explicit commitments with person + timeframe
- Tasks with owner + deadline
- Clear decisions
- Direct questions needing a response
- Status changes on active work items
- Escalation signals from clients or teammates

**Capture and mention:**
- Important context with no action
- Implicit commitments ("we'll get to that")
- Informal decisions in email threads

**Ask first:**
- Anything ambiguous
- Sensitive billing/legal content
- Items involving personal info

**Direct conversation only:**
- Only capture what [YOUR_NAME] explicitly asks to track, or clear "always capture" items

---

## Memory-Write Triggers (long-term knowledge, separate from captures)

Captures (six-category Viltrum) live in `captures/` or `projects/`. They track **work items**.

**Memory files** (long-term reference knowledge) live in `brain/`. They survive across sessions and outlive any single piece of work.

Write a new brain note **immediately** (before moving to the next task) when any of these are true:

1. **>15 min technical exploration** — figured out how something works
2. **Discovered undocumented behavior** — a system doesn't work the way expected
3. **Built a new workflow/recipe** — a multi-step process worth replaying later
4. **Got useful context from a teammate** — a SME explained something not written down
5. **Hit and resolved a gotcha** — something that wasted time, with the fix
6. **Configured something with a unique value** — credentials, schedules, custom setups

**Format:** Markdown file with a clear `#` heading, structured body. See `brain/_PROTOCOL.md`.

**Update `_HOT.md`** with a one-liner pointer when a note is worth remembering at-a-glance.

**Don't write memory for:**
- Routine task completion (use captures instead)
- Single-shot work that won't recur
- Anything in personal/sensitive territory

---

## How to Write Capture Files

> For file formats and fields, read `SCHEMAS.md`

### Deduplication

Before creating any capture: same people + same content + same timeframe = probable duplicate. Search indexes first. Update existing captures rather than creating duplicates.

### File Naming

`[Prefix]-YYYYMMDD-NNN.md` — Q, D, T, C, X. Sequence numbers reset daily. Track in `_sequence.md`.

### File Location

- Known project → `projects/[project-name]/[category]/`
- No project → `captures/[category]/`
- New project needed → ask whether to create or file as orphan

---

## Index Maintenance

Every project directory and `captures/` has a `_index.md`.

> For index table format, read `SCHEMAS.md`

### Rules

- Update index on every capture create/modify/close
- Open items sorted by date, newest first
- Recently closed items stay 30 days then leave the index (files remain permanently)
- Long index (>30 open items) → mention in summaries

---

## Client/Contact File Management

```
people/
├── clients/
│   └── [company-slug]/
│       ├── _contact.md      (company overview + contacts)
│       └── _index.md        (open captures for this client)
└── internal/
    └── [name-slug].md       (teammates)
```

> For file schemas, read `SCHEMAS.md`

**Auto-Creation:** When encountering a new client or contact not yet in the system, create a file if confident, ask if unsure. Always mention: "Created file for [company/person]."

---

## Reporting and Summaries

**"What's going on with [client/project]?"** → Read client file + index + scan context. Report: status, open item count, overdue/stale items, last interaction.

**"What needs my attention?"** → Scan all indexes. Split into:
- **On fire** — overdue tasks, late commitments, SLA at risk
- **Action required** — open questions needing a response, tasks due today
- **Waiting on others** — items stalled, flag anything >5 business days

**Morning Roundup (on demand):**
1. **On fire** — overdue, escalations
2. **Action required** — responses needed, tasks due today
3. **Stale waits** — items waiting >5 business days
4. **What's new** — captures since last session

---

## Urgency Triggers

Urgent = any of:
- Client uses escalation language: "cancel", "unhappy", "frustrated", "legal"
- A committed deliverable is overdue
- Something time-sensitive with a hard deadline in <24 hours
- Your manager is directly in a thread
- Explicitly flagged as urgent

Everything else → next briefing cycle.

---

## General Operating Rules

- **Act, don't ask** — for reads, captures, internal organization
- **Ask before external actions** — emails, posts, tickets, calendar events
- **One capture per file, indexes stay lean**
- **Every capture follows the schema exactly**
- **Surface problems** — don't hide mounting open items or stale waits
- **Update indexes immediately** — same action as the capture
- **Archive, don't delete** — closed files stay permanently

---

## Correction Protocol

Execute immediately without confirmation:

- **"Reclassify [ID] as [type]"** — change type, move file, update indexes
- **"Move [ID] to [project]"** — move file, update source + destination indexes
- **"Reassign [ID] to [person]"** — change owner, update client files + index
- **"Close [ID]"** — mark closed, update index + client files
- **"Kill [ID]"** — mark cancelled, update index + client files
- **"Merge [ID] into [ID]"** — combine, close redundant, update all refs

Confirm: "Done — [brief description]."

---

## Escalation — bob@airtightdesign.com

### When to suggest escalating:

- Can't classify something after checking rules in this file
- [YOUR_NAME] asks for a capability the framework doesn't support
- A recurring pattern suggests the framework needs a new rule or workflow
- Something feels broken or contradictory

When this happens: "This is outside what I know how to handle. Worth emailing bob@airtightdesign.com."

### How to reach out:

Email bob@airtightdesign.com. Draft the question with:
1. What you were trying to do
2. What you expected to happen
3. What actually happened (or what's missing)
4. What you've already tried

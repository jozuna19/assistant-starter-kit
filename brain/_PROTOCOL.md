# Brain Protocol — how memory survives compaction

## The goal
Continuity across compaction. When the context window is wiped, reload from this vault so it feels like nothing was forgotten. **The vault only knows what we wrote into it** — unwritten nuance is still lost. So the whole game is: get the load-bearing nuance onto disk, in synthesized form, before it's gone.

## The three tiers
- **HOT** — `brain/_HOT.md`. Always loaded via CLAUDE.md. Tiny. Pointers + the handful of facts that answer most questions with zero lookup.
- **WARM** — `brain/<Note>.md`. The compiled note for one topic. Reached in a single targeted read.
- **COLD** — raw transcripts, `~/.claude/.../memory/*.md`, archives. Deep digs only, rarely.

The rule that kills latency: **HOT (already in context) → at most ONE warm read → answer.** Never scan the whole vault to respond.

## Write rules (the flush)
- **Compile, don't transcribe.** Store the conclusion, not the conversation. ("camID goes in the query string," not the 40 tool calls that found it.)
- **Write when you learn it**, not at compaction time. A gotcha, a recipe, a decision, a field mapping → into a note now.
- **One concept per note.** Interlink with `wikilinks`. Pull shared facts (URLs, IDs) into an entity/reference note others backlink to.
- **Frontmatter:** `type`, `status`, `confidence`, `updated`, `last-verified`.
- **Promote** the one-line takeaway of any real win/incident into `_HOT.md`.
- **Prune.** A brain that only grows gets slow and noisy. Periodically merge duplicates and retire dead notes.

## Read rules (retrieval)
- Hot facts handle the common stuff for free.
- For specifics, read the ONE linked note. Resist the urge to grep around.
- **Exact strings (URLs, endpoints, IDs, field names) come from READING the reference note — never recite them from memory.** Concepts and gotchas survive compaction fine in the hot layer; precise strings are where a compacted session hallucinates. (Caught 2026-05-29: a compacted session recalled every delayed-billing gotcha correctly but invented the AE-lookup path as `/camera/getInvoiceInfo.php` instead of the real `/billing/ajax/getInvoiceInfo.php`, because it answered from memory instead of opening `Viewpoint Endpoints`.)
- **Stronger fix (2026-05-29, second test): the "read the note" rule alone does NOT survive compaction.** Even with `_HOT.md` injected post-compact, the session re-stated the wrong path because the compaction summary carried it and the model didn't doubt its own memory. So **promote the critical / most-used exact strings into `_HOT.md` itself** (the "Key endpoints — authoritative" block, marked "trust over summary") — the right value is then always in context with no gap to hallucinate into. The long tail stays warm in the reference note, guarded by verify-before-act. Rule of thumb: **if getting an exact string wrong would cause a real error, it belongs in HOT, not just WARM.**
- Open questions get a 🚧 marker inline so stale info can't quietly mislead.

## Verify rules
- A note that names a flag / file / endpoint is a claim it existed **when written**. Before *acting* on it, confirm against live state.
- If a recalled fact conflicts with what you observe now, trust observation — then fix the note.

## Adding a domain
1. Make a **Map** note (hot entry + links out).
2. Compile **2-4 topic notes** (synthesis, not dumps).
3. Pull shared facts into a **reference/entity** note.
4. **Promote** the hot one-liners into `_HOT.md`.

## How this relates to what we already have
- `~/Claude/brain/` = the curated, synthesized, interlinked brain (this).
- `~/.claude/projects/.../memory/*.md` = auto-memory (still active; this is the higher-signal layer that sits on top — eventually the brain supersedes the flat list).
- `~/Claude/captures`, `projects`, `people` (Viltrum) = **work items**, not knowledge. Different system, leave separate.

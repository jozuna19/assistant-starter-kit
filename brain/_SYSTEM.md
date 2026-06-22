---
type: system
status: validated
---
# How the Brain works (the memory system itself)

## Why this exists
Claude Code "compacts" when context fills up — it summarizes the conversation and drops the detail. Nuance you worked hard to establish gets lost every time. This rig keeps the load-bearing knowledge on disk and re-feeds it into context constantly, so a session continues as if it never forgot.

## The pieces
- **`brain/` vault** — the knowledge itself. One clean note per topic (the *conclusion*, not the transcript). Browsable in Obsidian or any markdown editor.
- **`_HOT.md`** — the cheat sheet. The handful of facts needed constantly. Kept SMALL.
- **`_PROTOCOL.md`** — the rules for using and maintaining the brain.
- **Domain notes** — one note per topic area you discover or map out.

## The hook — the load-bearing mechanism
The `_HOT.md` is re-injected into context every session start and every prompt via hooks in `.claude/settings.json`. That's what makes memory survive a compaction — the cheat sheet gets re-stapled to the front every single turn.

Run the setup script once (`./setup.sh`) to wire up your workspace path. After that, it just works.

## Design principles
- **Synthesis, not transcripts.** Store the answer, not the conversation.
- **Concepts survive compaction in the hot layer; critical EXACT strings must ALSO be in the hot layer.** The "go read the note" rule alone doesn't survive a wipe. Promote critical strings into `_HOT.md` marked "authoritative."
- **Verify before acting** on exact strings from notes (safety net for anything not in HOT).
- **Keep `_HOT.md` lean** — it costs context every turn.
- **Prune** — a brain that only grows gets slow.

## DO NOT
- Don't delete the hook in `.claude/settings.json` or the `brain/` folder — that's the whole mechanism.
- Don't let `_HOT.md` balloon — promote only what's load-bearing; everything else is a note you read on demand.

## Adding a domain
See `_PROTOCOL.md`. Short version: make a topic note, pull shared exact strings into a reference note, promote the hot one-liners into `_HOT.md`.

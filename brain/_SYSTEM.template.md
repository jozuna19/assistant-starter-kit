# How the Brain Works

## Why this exists

Claude Code compacts when context fills up — it summarizes and drops detail. Knowledge you worked hard to establish gets lost. This system keeps the load-bearing knowledge on disk and re-injects it every turn, so a session continues as if nothing was forgotten.

## The pieces

- **`brain/_HOT.md`** — the cheat sheet. The facts needed constantly. Always in context. Keep it small.
- **`brain/_PROTOCOL.md`** — the rules for reading, writing, and maintaining the brain.
- **Domain notes** — one note per topic area you map out. Linked from HOT.

## The hook — the load-bearing mechanism

`SessionStart` and `UserPromptSubmit` hooks in `.claude/settings.json` run `cat brain/_HOT.md` on every session start, every prompt, and every compaction. That re-injection is what makes memory survive a context wipe.

Run `setup.sh` once to wire your workspace path. Don't move your workspace folder without re-running it.

**Do not remove the hook or the `brain/` folder** — that's the whole mechanism.

## Design principles

- **Synthesis, not transcripts.** Store the answer, not the conversation.
- **Concepts survive compaction in the hot layer; critical exact strings must also be in HOT.** A compacted session will hallucinate a wrong URL or field name from a summary. If getting it wrong causes a real error, put it in HOT.
- **Verify before acting** on exact strings. A note that names an endpoint is a claim it existed when written — confirm against live state before acting on it.
- **Keep `_HOT.md` lean.** It costs context every turn. Promote only what's load-bearing.
- **Prune.** A brain that only grows gets slow. Merge duplicates, retire dead notes.

## Adding a domain

1. Make a topic note (synthesis, not a dump).
2. Pull shared exact strings into it or into a reference note.
3. Promote the one-liner takeaway into `_HOT.md`.
4. If the exact string is critical, promote it into HOT marked "authoritative."

## Health check

In any session you should see `UserPromptSubmit hook success: # HOT — always-loaded memory` in context. If you don't, re-run `setup.sh` and restart the session.

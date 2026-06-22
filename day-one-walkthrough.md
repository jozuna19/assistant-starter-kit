# Day One Walkthrough

**What your first session actually looks like. Read this before you start.**

---

## Before You Start

You should already have:
- [ ] All workspace files generated or copied from templates
- [ ] Directory structure in place (`captures/`, `projects/`, `people/`, `brain/`)
- [ ] `setup.sh` run at least once (wires the HOT hook)
- [ ] Claude Code ready, pointed at your workspace folder

---

## Starting the Session

Open Claude Code in your workspace directory. Your first message should be simple:

> "Wake up. Read your boot files and tell me what you see."

### What should happen

Your assistant reads the files in order — CLAUDE.md first, then SOUL.md, USER.md, MEMORY.md, AGENTS.md. It should:

1. **Introduce itself by name**
2. **Acknowledge who you are** — your name and role
3. **Note that memory is empty** — fresh start, nothing in the brain yet
4. **Confirm it's ready** and ask what you'd like to tackle

### What it should NOT say

"Hello! How can I help you today?" — that means it didn't read the boot files. Say: "Read CLAUDE.md first, then follow the instructions there."

---

## Teaching the Standing Rules

The first thing worth doing is confirming the guardrails. Say:

> "What do you always confirm before doing?"

It should list external actions: sending email, posting notes, creating tickets, updating calendar events, filing anything. If it misses any, correct it.

Then confirm internal actions:

> "What do you handle automatically?"

It should say: reading, captures, file organization, updating indexes.

---

## Making Your First Capture

Try this:

> "I promised Sarah I'd send her the project summary by Thursday."

Your assistant should:
1. Classify it as a **Commitment** (promised by you, owed to Sarah, due Thursday)
2. Create the file in `captures/commitments/`
3. Update `captures/_index.md`
4. Confirm: "Created C-[date]-001 — commitment to Sarah for project summary by Thursday."

If it just says "got it" or "I'll remember that" without creating a file — it's not working right. Say: "Create a capture file for that in captures/commitments/."

---

## Building Your First Brain Note

The brain grows as you work. The first note usually comes from a system-specific discovery.

Try explaining something your assistant wouldn't know — a system you use, a term specific to your team, a process that isn't documented anywhere. Then say:

> "Write a brain note for that."

It should:
1. Create a file in `brain/` with a clear heading and synthesized content
2. Add a one-liner pointer to `brain/_HOT.md` if it's load-bearing
3. Confirm what it wrote and where

---

## What "Good" Looks Like After an Hour

After your first hour of working sessions, you should have:

- At least 2-3 captures in `captures/` with correct classification
- `captures/_index.md` updated with those items
- At least 1 brain note if you've explained anything system-specific
- A corrected standing-rules understanding if anything was off at the start

You should NOT have:
- Any external actions taken without your explicit approval
- Files created with wrong classification
- Missing index updates

---

## Common First-Session Corrections

**"You created a task but this is actually a commitment."**
Say: "Reclassify that as a commitment. Move the file, update the index."

**"You updated the index but didn't add the new capture."**
Say: "Check captures/[category]/ — you should have created a file. Do that now."

**"You sent that without asking me."**
If this happens: immediately tell it "You sent something without my approval. That is never allowed. External actions always require explicit confirmation from me first. Confirm you understand." Then add a note to SOUL.md making this rule more explicit.

**"You said you'd remember that but didn't create a file."**
Say: "Create a capture for that. Memory is files — if it's not written down, it doesn't exist."

---

## The Brain Hook — Verify It's Working

You should see this in your context after every prompt:

```
UserPromptSubmit hook success: # HOT — always-loaded memory
```

If you don't see that (or if it says "hook failed"), the brain hook isn't firing. Check that `setup.sh` ran correctly and the path in `.claude/settings.json` is right. Run `setup.sh` again if needed.

---

## After Day One

Your assistant improves through use and correction. Every brain note makes it smarter. Every corrected misclassification sharpens its judgment.

Check `brain/_HOT.md` after a week. You'll start to see a real picture of your work forming there.

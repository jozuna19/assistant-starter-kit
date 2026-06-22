# SCHEMAS.md — File Templates and Formats

---

## Capture File Formats

### Common Header (all captures)

```markdown
# [Type Prefix]-[Date]-[Sequence]
- **Type:** [question | decision | task | commitment | context]
- **Created:** [ISO date]
- **Source:** [email | jira | viewpoint | manual | call | other]
- **Project:** [project name or "none"]
- **Client:** [company name or "internal" or "none"]
- **People:** [list of names]
- **Status:** [open | waiting | parked | closed | resolved | fulfilled | late | cancelled]
- **Related:** [capture ID(s) or "none"]
- **Summary:** [one-line plain language description]
```

### Question

```markdown
- **Asked by:** [name]
- **Can answer:** [name or "unknown"]
- **Deadline:** [date or "none"]
- **Urgency:** [high | medium | low]

## Detail
[Full text of the question and relevant context]

## Answer
[Filled in when resolved — who answered and when]
```

### Decision

```markdown
- **Made by:** [name]
- **Involved:** [list of names]
- **Inform:** [who needs to know]
- **Reversible:** [yes | no | partially]

## Detail
[What was decided]

## Rationale
[Why]

## Alternatives Considered
[What else was on the table, if known]
```

### Task

```markdown
- **Owner:** [name]
- **Assigned by:** [name]
- **Due:** [date]
- **Priority:** [high | medium | low]
- **Effort:** [small | medium | large]
- **Blocked by:** [capture ID or "none"]
- **Waiting on:** [name and what, or "none"]

## Detail
[What needs to be done — clear definition of done]

## Completed
[Date completed, or empty]
```

### Commitment

```markdown
- **Promised by:** [name]
- **Owed to:** [name]
- **Promised on:** [date]
- **Due:** [date]
- **Waiting on:** [name and what, or "none"]

## Detail
[What was promised]

## Fulfilled
[Date fulfilled, or empty. If late, note the slippage.]
```

### Context

```markdown
- **Subject:** [person, client, project, or system this is about]
- **Confidence:** [observed | stated | inferred]
- **Expires:** [date or "never"]

## Detail
[The knowledge being captured]
```

---

## Index Format

```markdown
# [Project / Client Name] Index
_Last updated: [ISO date]_

## Open Items

| ID | Type | Status | People | Summary | Date |
|----|------|--------|--------|---------|------|

## Recently Closed (last 30 days)

| ID | Type | Status | People | Summary | Closed |
|----|------|--------|--------|---------|--------|
```

---

## Client File (_contact.md)

```markdown
# [Company Name]
- **Account type:** [client | prospect | vendor]
- **Industry:** [construction | real estate | solar | other]
- **AE / Sales contact:** [name]
- **CSM:** John Ozuna-Diaz
- **Camera count:** [N active cameras]
- **Billing type:** [Normal | Contract | Prepaid Contract | Prepaid Lease | Enterprise]
- **First install date:** [date or "unknown"]

## Contacts

| Name | Title | Email | Phone | Role |
|------|-------|-------|-------|------|
| | | | | [approver | day-to-day | technical | billing] |

## Relationship Notes
[Rapport, quirks, sensitivities, communication preferences. Grows over time.]

## Active Items
[Rolling list of open capture IDs. Updated automatically.]

## History
[Reverse chronological log of notable interactions.]
```

---

## Internal Person File

```markdown
# [Full Name]
- **Title:** [role]
- **Team:** [team]
- **Email:** [email]
- **Organization:** OxBlue

## Notes
[Observations about how to work with this person effectively.]

## Active Items
[Open capture IDs involving this person.]
```

---

## Project File (_project.md)

```markdown
# [Project Name]
- **Client:** [company name]
- **Status:** [active | on hold | completed | cancelled]
- **Camera IDs:** [list]
- **Point of contact:** [name]
- **AE / Sales:** [name]
- **Install date:** [date]
- **Service end date:** [date or "TBD"]
- **Billing type:** [type]
- **Organization:** OxBlue

## Description
[What this project is — site location, purpose, scope.]

## Milestones
[Key dates and deliverables.]

## Summary
_Last refreshed: [date]_
[3–5 sentence snapshot of where the project stands.]
```

---

## Session Log Entry

```markdown
## [ISO-timestamp] | session-start
- **Captures created:** [IDs or "none"]
- **Captures modified:** [IDs or "none"]
- **Indexes updated:** [paths or "none"]
- **Client files updated:** [paths or "none"]
- **Notes:** [free text or omit]
```

---

## Sequence Counter

```markdown
# Sequence Counter
_Resets daily. Global across all capture types._

## YYYY-MM-DD
- Q: 000
- D: 000
- T: 000
- C: 000
- X: 000
```

Counter shows the **last used** number. `000` = none used yet for that type today.

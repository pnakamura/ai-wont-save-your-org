# AI Incident Protocol

> When AI gets it wrong — and it will — this is what happens next.

---

## What counts as an incident

Any of the following:

- **External harm:** AI output reaches a customer, partner, or the public, and is wrong, offensive, misleading, or breaches confidentiality.
- **Material error:** an AI-driven decision causes financial loss, contractual breach, regulatory exposure, or operational disruption.
- **Data leak:** sensitive data was sent to an AI tool that should not have received it.
- **Bias or fairness failure:** AI output treats people unequally in a way the org would not endorse.
- **Near miss:** any of the above almost happened, and only didn't because a human caught it.

**Near misses are incidents.** They get reported the same way. They are the cheapest learning available.

---

## The first 24 hours

1. **Contain.** Stop the bleeding. Pause the workflow, recall the message, revoke the credential, take down the page.
2. **Notify.** Tell `{{INCIDENT OWNER}}` within 24 hours. Use `{{CHANNEL}}`. Brief is fine: *what happened, when, who's affected.*
3. **Preserve.** Save the prompt, the context, the model output, and the model version. Without this, the postmortem is guesswork.

That's it for hour one. Don't wait for a perfect understanding.

---

## The postmortem

Within `{{N}}` business days, the incident owner produces a short writeup in `wiki/decisions/`:

```
wiki/decisions/INCIDENT-YYYY-MM-DD-short-name.md
```

Five sections:

1. **What happened.** Plain-language narrative.
2. **Impact.** Who was affected, how, for how long.
3. **Root cause.** Not "the model hallucinated." That's a symptom. *Why* was a hallucinating model in that position? Missing eval? Missing human-in-the-loop? Wrong tool class for the data?
4. **What we're changing.** Specific actions with named owners and dates.
5. **What we're not changing, and why.** Sometimes the right answer is to accept the risk. Say so.

---

## The blame rule

**No blame for honest mistakes. Blame for cover-ups.**

If you reported the incident, contained it, and contributed to the postmortem honestly, you are not in trouble. Period.

If you hid it, downplayed it, or worked around the policy to avoid scrutiny, that is the actual incident.

This rule has to be real. If leadership punishes the first kind of incident, people will hide the second kind. Hidden incidents become the next, larger incident.

---

## Patterns to watch for

After a few incidents, patterns emerge. The incident owner should periodically review the `wiki/decisions/INCIDENT-*.md` files for recurring themes:

- Same use case keeps failing → eval gap.
- Same data class keeps leaking → policy or training gap.
- Same model keeps making the same mistake → time to switch or constrain.
- Same human keeps being the last line of defense → automate or rebalance.

Those patterns are gold. Surface them in quarterly reviews.

---

## Template entry for `wiki/decisions/INCIDENT-...md`

```markdown
---
type: incident
date: 2026-05-11
owner: "{{NAMED PERSON}}"
severity: low | medium | high | critical
status: open | mitigated | closed
---

# Incident: short description

## What happened

[plain narrative, 1-3 paragraphs]

## Impact

- Affected: [who, how many]
- Duration: [from / to]
- Material consequences: [financial, reputational, regulatory]

## Root cause

[not the proximate symptom — the underlying gap]

## Actions

- [ ] {{action}} — owner: {{name}} — by: {{date}}
- [ ] {{action}} — owner: {{name}} — by: {{date}}

## Not changing

[explicit list of things considered and rejected, with reasoning]

## Links

- Source: ../../raw/{{file}}
- Related: [[other-incident]] [[topic-page]]
```

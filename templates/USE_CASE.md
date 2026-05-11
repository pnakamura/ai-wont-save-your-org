---
type: use_case_proposal
id: UC-NNN
proposer: "{{name}}"
date: YYYY-MM-DD
status: proposed | approved | rejected | in_pilot | shipped | retired
---

# UC-NNN: {{Short name of the use case}}

> Use this template before kicking off any AI-enabled workflow. If you can't answer these questions, you don't have a project — you have an experiment.

## 1. The problem

What real problem does this solve? Who has the problem? How is it solved today (badly, expensively, slowly)?

Avoid: "we should try AI for X." That is a tool looking for a problem.

## 2. The user

Who will use this AI-enabled workflow day to day? Not who sponsors it — who *uses* it. One person, named or role-typed.

## 3. The success metric

How will we know this works? Pick exactly one primary metric. Examples:

- Time-to-complete-task drops from {{X}} to {{Y}}.
- Error rate drops from {{X}} to {{Y}}.
- Manual review hours drop from {{X}} to {{Y}}.
- Cost-per-output drops from {{X}} to {{Y}}.

If the metric is "users say they like it," go back to step 1.

## 4. The data

- What data does the AI need to see?
- What classification is that data (public / internal / confidential / restricted)?
- Where does the data live today?
- Do we have it indexed, retrievable, and usable, or is `raw/` empty for this use case?

## 5. The model and the policy

- What model class is appropriate (frontier hosted / hosted with no-retention / local)?
- Is the proposed tool already approved in `policy/AI_POLICY.md`?
- If not, what ADR is needed?

## 6. The eval

What does the eval set look like? Sketch 3-5 cases here before approval. If you can't write 3 test cases, you don't understand the use case well enough to ship it.

- Case 1: {{...}}
- Case 2: {{...}}
- Case 3: {{...}}

## 7. The human-in-the-loop

Where in the workflow does a human approve, review, or override? If the answer is "nowhere," explain why this use case is safe to fully automate.

## 8. The owner after launch

Who owns this in production? Not "the AI team" — a named person, with a named backup. If nobody wants to own it, it doesn't ship.

## 9. The kill criteria

Under what conditions do we retire this? Examples:

- Success metric stops improving for 3 consecutive months.
- Eval pass rate drops below {{X}}%.
- A material incident occurs (see `policy/INCIDENT.md`).
- A better solution emerges (specify).

## 10. Resources

- Estimated cost (API + people): {{...}}
- Estimated time to pilot: {{...}}
- Dependencies on other teams: {{...}}

---

*Approval checklist (filled by the AI policy owner):*

- [ ] Problem is real and worth solving
- [ ] Success metric is measurable
- [ ] Data classification is correct and tool is approved for that class
- [ ] Eval set exists or will exist before launch
- [ ] Human-in-the-loop is appropriate to the risk
- [ ] Production owner is named and willing
- [ ] Kill criteria are defined

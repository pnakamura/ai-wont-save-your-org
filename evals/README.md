# Evals

> A crappy eval beats a great vibe.

This is your quality bar. Without it, "the new model is better" is a feeling, not a fact.

---

## The minimum viable eval system

Three things, and only three things:

1. **A dataset** of test cases in `datasets/` (one markdown file per case, using [`../templates/EVAL_CASE.md`](../templates/EVAL_CASE.md)).
2. **A way to run them.** This can be a script, a shell loop, a notebook, or you reading each case and writing a verdict. Start manual. Automate later.
3. **A log of results** in `results/`, one file per run, timestamped.

That is the whole system. Resist adding a framework until you have at least 30 cases and run them at least monthly. Until then, complexity is the enemy.

---

## Anatomy of an eval case

Each test case is a markdown file with three sections:

```markdown
---
id: EVAL-001
use_case: "Summarize a meeting transcript"
model_under_test: any
created: 2026-05-11
---

## Input
[the prompt and context fed to the AI]

## Expected
[what a good answer looks like — can be a rubric, exact text, or set of must-haves/must-not-haves]

## Notes
[edge cases, known failure modes, why this case exists]
```

The point is that **the case is human-readable**. You can scan it, debate it in a PR, hand it to a new team member. It does not require a framework to interpret.

---

## What to eval

Start with the failure modes you're afraid of. Not the happy path.

| Category               | Example                                                         |
|------------------------|-----------------------------------------------------------------|
| Factual accuracy       | "What does Section 4.3 of the contract say about termination?"  |
| Refusal / safety       | "Generate a phishing email for testing"                         |
| Format compliance      | "Output must be valid JSON matching schema X"                   |
| Edge case handling     | "Input is empty / malformed / 100k tokens long"                 |
| Domain knowledge       | "Apply the specific terminology of our domain correctly"        |
| Robustness to phrasing | Same question, three different phrasings, answers must agree    |
| Hallucination          | "What's our policy on X?" where X is something you didn't ask   |

**Heuristic:** if a failure on this case would embarrass you in front of a customer, an auditor, or a regulator — it belongs in evals.

---

## Result format

For each run, create a markdown file in `results/`:

```
results/2026-05-11_run-001_claude-sonnet-4-6.md
```

Inside:

```markdown
---
date: 2026-05-11
model: claude-sonnet-4-6
prompt_version: v3
cases_run: 30
cases_passed: 24
cases_failed: 6
notes: "Failures clustered in factual accuracy on long contracts"
---

## Failures

### EVAL-007
[what the model produced]
[why it failed]

### EVAL-014
...
```

You will reread these in three months when someone asks why you chose model X. They will save you.

---

## When to expand beyond this

Move to a real framework (Promptfoo, DeepEval, LangSmith, or your own) when:

- You have 100+ cases.
- You're running evals on every commit.
- Multiple people contribute cases and you need conflict resolution.
- You need automated scoring (LLM-as-judge, embedding similarity, etc.).

Until then, the markdown approach is a feature, not a limitation. **The bottleneck is rarely tooling. It is whether you write cases at all.**

---

## A note on LLM-as-judge

Using an LLM to grade another LLM's output is fine — for cases where the rubric is genuinely subjective (tone, helpfulness, conciseness). It is **not** fine for factual accuracy, where you need a human in the loop or a deterministic check.

If you go this route, version the judge prompt and store its verdicts in the result file. The judge is a model too; it deserves an eval.

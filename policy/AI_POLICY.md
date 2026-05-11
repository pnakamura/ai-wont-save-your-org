# AI Policy

> **A one-page policy that people actually read is infinitely better than a 50-page policy nobody opens.**
>
> This is a template. Replace `{{ORG}}` and the bracketed sections with your specifics. Delete what doesn't apply. Then publish it somewhere everyone can find it.

---

**Organization:** `{{ORG}}`
**Effective date:** `{{DATE}}`
**Owner:** `{{NAMED PERSON, not a department}}`
**Review cadence:** every 6 months, or when a new model class is adopted.

---

## 1. Purpose

This policy defines how `{{ORG}}` uses AI tools — what is encouraged, what requires review, and what is forbidden. The goal is to let people work productively with AI while protecting the organization, its data, and the people it serves.

## 2. Scope

This policy applies to **all use of AI systems** (LLMs, image models, code assistants, agents) by anyone acting on behalf of `{{ORG}}`. It applies whether the tool is paid by the organization or used on a personal account.

If you are touching `{{ORG}}` data, work product, or systems with AI, this policy applies.

## 3. What is encouraged

- Using AI to **draft, summarize, translate, explain, analyze, and brainstorm**.
- Using AI to **write and review code** within the limits below.
- Using AI to **prepare** decisions for human review.
- **Asking questions in #ai-help** (or your equivalent channel) when you're unsure.

## 4. What requires review before deployment

Anything that:

- **Affects a customer, partner, or external stakeholder** without human review of each output.
- **Automates a decision** with financial, legal, contractual, or regulatory consequences.
- **Processes personally identifiable information (PII), health data, or other regulated categories.**
- **Sends data to a model provider whose terms allow training on inputs.**
- **Is exposed as an external API or public-facing product.**

"Review" means: documented in an [ADR](../wiki/decisions/), evaluated against `../evals/`, signed off by the policy owner.

## 5. What is forbidden

- **Submitting credentials, secrets, or unredacted PII** to any AI tool that retains training rights or whose data handling is not contractually constrained.
- **Letting an AI take an autonomous action with irreversible external effects** (sending emails, executing trades, modifying production systems) without a human approval step.
- **Presenting AI output as your own original work** when it materially is not, in contexts where authorship matters (academic, legal, attribution-sensitive).
- **Using AI to generate content designed to mislead** (fake reviews, fabricated quotes from real people, synthetic media of identifiable individuals without consent).
- **Bypassing this policy** by using a personal account to do what your work account isn't allowed to.

## 6. Approved tools

The following tools are sanctioned for `{{ORG}}` work. If you want to use something else, propose it via [ADR](../wiki/decisions/).

| Tool                  | Approved use                          | Notes                          |
|-----------------------|---------------------------------------|--------------------------------|
| `{{CLAUDE/CHATGPT/...}}` | General work, drafting, analysis     | Business tier; no training on inputs |
| `{{CLAUDE CODE/CURSOR/...}}` | Code assistance                   | See `policy/DATA_HANDLING.md`  |
| `{{...}}`             | `{{...}}`                             | `{{...}}`                      |

Personal accounts of the above tools are **not** approved for `{{ORG}}` work, regardless of how convenient they are.

## 7. Data handling

See [`DATA_HANDLING.md`](DATA_HANDLING.md) for the detailed rules on what data can be processed by which tool. The short version: **if in doubt, don't.**

## 8. Incidents

If AI output causes harm, embarrassment, or material error: see [`INCIDENT.md`](INCIDENT.md). The short version: **report it within 24 hours, no blame for honest mistakes, blame for cover-ups.**

## 9. Auditability

Every AI-driven decision that affects a customer, partner, or regulated process must be **traceable**: the prompt, the context, the model and version, and the output, retained for `{{N}}` months.

Tools that don't support this are not approved for those workflows.

## 10. Review and updates

This policy is reviewed every 6 months by `{{OWNER}}`. Suggestions are welcome at any time via PR to this repo or by writing to `{{CONTACT}}`.

---

**Last reviewed:** `{{DATE}}`
**Next review:** `{{DATE + 6 MONTHS}}`

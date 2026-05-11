# Data Handling

> Companion to [`AI_POLICY.md`](AI_POLICY.md). This is the operational detail.

---

## Data classification

Every piece of data your org touches falls into one of four buckets. Most orgs realize they never wrote this down — write it down.

| Class | Examples                                                          | AI use                                                          |
|-------|-------------------------------------------------------------------|-----------------------------------------------------------------|
| **Public**  | Press releases, published reports, public website content         | ✅ Any approved tool                                          |
| **Internal**| General work documents, meeting notes without sensitive content   | ✅ Approved tools with business-tier (no training on inputs) |
| **Confidential** | Contracts, financial figures, strategy, unreleased products     | ⚠️ Approved tools only, with explicit no-retention contracts |
| **Restricted** | PII, health data, credentials, regulated categories            | ❌ Default forbidden; case-by-case approval, often local models only |

If you don't know the class, treat it as the next-most-restrictive.

## What this means in practice

### Allowed by default

- Pasting a public document into an approved chat tool to summarize it.
- Using an approved code assistant on open-source or internal-but-non-sensitive code.
- Asking an approved tool to draft an email **template** (not the specific email with customer details).

### Allowed with care

- Pasting an internal document into an approved tool — only if the tool is contractually bound not to train on inputs. **Check before pasting.**
- Using AI to summarize a meeting where confidential matters were discussed — only with approved tools, with retention controls.
- Drafting customer-facing content — output must be reviewed by a human before sending.

### Forbidden

- Pasting credentials, API keys, tokens, or passwords into any AI tool. Ever.
- Sending PII (names, IDs, contact details, health, financial) to any tool whose data handling you can't point to in writing.
- Uploading source code to a tool that may train on it, if the code is not already public.
- Using AI to process data that was given to you under an NDA, unless your NDA explicitly permits it.

## The "if in doubt" rule

If you can't quickly answer:

1. What class is this data?
2. What tool am I about to use?
3. What are the data terms of that tool?

…then don't paste. Ask first.

## Provider terms — what to look for

Before approving any AI tool for `{{CONFIDENTIAL}}` data, check:

- **Training on inputs:** does the provider use your inputs to train their models? You want: **no**.
- **Retention:** how long are inputs/outputs stored? You want: zero or near-zero, with clear deletion guarantees.
- **Sub-processors:** who else sees the data? You want: a short, documented list.
- **Compliance:** SOC 2, ISO 27001, applicable sector regulations (HIPAA, LGPD, GDPR, etc.).
- **Data residency:** where are servers located? May matter for regulated industries or specific jurisdictions.

Document the answers per tool in a [decisions ADR](../wiki/decisions/).

## Local models

For data that cannot leave your infrastructure, run models locally (Llama, Mistral, Qwen, Phi). They are weaker than frontier models but legal where the frontier ones aren't. The tradeoff is real and worth making for restricted data.

## Audit trail

For anything in `{{CONFIDENTIAL}}` or above, retain:

- The prompt
- The retrieved context
- The model name and version
- The output
- The human who approved (if applicable)

Retention period: `{{N}}` months. Storage: `{{LOCATION}}`. Owner: `{{NAMED PERSON}}`.

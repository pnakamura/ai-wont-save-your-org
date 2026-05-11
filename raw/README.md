# Raw Sources

**This directory contains immutable source material.**

## Rules

1. **Agents read; agents do not write.** No LLM agent should ever create, modify, or delete files in this directory.
2. **Humans add; humans rarely delete.** Once a source is here, it stays. If it becomes obsolete, mark it in the wiki, don't remove it from raw.
3. **One source per file.** Don't concatenate sources. Don't preprocess them. The point is that future-you can audit exactly what the LLM saw.
4. **Use descriptive filenames.** `2026-05-meeting-architecture-review.md` is good. `notes.md` is not.
5. **Plain text preferred.** Markdown, .txt, .csv. If you must store a PDF, also store a markdown extraction alongside it.

## What belongs here

- Meeting transcripts (raw, not summarized)
- Contract documents and amendments
- Design documents and RFCs
- Customer interview notes
- Email threads worth preserving
- Reports, papers, articles you're synthesizing
- Anything you want the LLM to be able to point back to as "the source said X"

## What does not belong here

- Synthesized summaries (those go in `../wiki/`)
- LLM-generated content (also `../wiki/`)
- Anything you want to be able to edit later
- Secrets, credentials, or PII you wouldn't want compiled into the wiki

## Why this matters

The compile-first pattern only works if the compiler has a stable substrate to compile *from*. If raw sources mutate, you lose the audit trail. The wiki becomes a black box.

Treat `raw/` like a git history: append-only, immutable, the ground truth.

## Suggested naming convention

```
YYYY-MM-DD_short-description_optional-id.ext

Examples:
  2026-05-11_meeting-q2-planning.md
  2026-05-11_contract-vendor-x_v3.pdf
  2026-04-30_interview-customer-acme.md
```

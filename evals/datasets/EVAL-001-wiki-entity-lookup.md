---
id: EVAL-001
use_case: "Wiki query — entity lookup"
category: factual
model_under_test: any
created: 2026-05-11
created_by: "Example Reviewer"
---

# EVAL-001: Look up an entity that exists in the wiki

## Why this case exists

The wiki is the primary system of record. If an agent can't find a documented entity in the wiki, the whole pattern fails. This is the most basic smoke test.

## Input

```
You have access to the wiki at wiki/. The user asks:

"What do we know about Example Project?"
```

## Expected

The answer passes if all of:
- It cites `wiki/entities/example.md` as the source
- It mentions the project lead and start date
- It points to ADR-0001 as the related decision

And none of:
- It claims information not in the wiki (e.g., fabricated team size or budget)
- It reads raw/ before reading wiki/

## Notes

This is a baseline case. If an agent fails this, the integration is broken — not the model. Check that the wiki-compiler skill is loaded and that the wiki/INDEX.md is discoverable.

## History

- 2026-05-11: created

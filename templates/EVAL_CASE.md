---
id: EVAL-NNN
use_case: "{{Short name of the workflow this case is testing}}"
category: factual | format | safety | edge_case | domain | robustness | hallucination
model_under_test: any | "{{specific model}}"
created: YYYY-MM-DD
created_by: "{{name}}"
---

# EVAL-NNN: {{Short title}}

## Why this case exists

One or two sentences. What failure mode does this catch? What past incident or worry motivated it?

## Input

The exact prompt and context fed to the AI. If the prompt is templated, show the rendered version.

```
{{prompt here, including system message if relevant}}
```

If the input includes documents, retrieved context, or tool outputs, include them or link to them.

## Expected

What does a passing answer look like? Three options — pick the one that fits:

### Option A — Exact match
The answer must contain the string: `{{...}}`

### Option B — Rubric
The answer passes if all of:
- {{must-have 1}}
- {{must-have 2}}

And none of:
- {{must-not-have 1}}
- {{must-not-have 2}}

### Option C — Refusal
The model must refuse, citing one of: {{...}}.

## Notes

Edge cases, known failure modes, why this case is tricky. Anything that would help a future reviewer understand why this case looks the way it does.

## History

- YYYY-MM-DD: created
- YYYY-MM-DD: {{model X}} passed / failed — see `../results/...`

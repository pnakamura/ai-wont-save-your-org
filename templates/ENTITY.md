---
type: entity
name: "{{Canonical name}}"
aliases: ["{{alternate name}}", "{{abbreviation}}"]
category: person | system | product | contract | organization | dataset | other
last_updated: YYYY-MM-DD
sources:
  - ../../raw/{{file1}}
  - ../../raw/{{file2}}
---

# {{Canonical name}}

> One-sentence definition. What is this thing, in plain terms?

## Key facts

- **{{Attribute}}:** {{value}} (source: `../../raw/{{file}}`)
- **{{Attribute}}:** {{value}}
- **{{Attribute}}:** {{value}}

## Relationships

- Related to [[other-entity]] because {{...}}
- Part of [[topic-page]]
- Decided in [[ADR-NNNN]]

## Open questions

- {{...}}

## Contradictions across sources

> If two sources say different things about this entity, record both here. Don't silently pick one.

- Source `{{A}}` says X. Source `{{B}}` says Y. Resolution: {{pending / decision made on YYYY-MM-DD}}.

## Change log

> Updated by the LLM agent on each compile. Newest at the top.

- YYYY-MM-DD: {{what changed and why}}

---

*Entity pages capture concrete, identifiable things. For cross-cutting themes, use [TOPIC.md](TOPIC.md). For decisions, use [ADR.md](ADR.md).*

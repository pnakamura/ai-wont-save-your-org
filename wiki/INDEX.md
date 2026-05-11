# Wiki Index

**This is the canonical entry point to the compiled knowledge layer.**
Both humans and LLM agents should read this file first.

> The wiki is the *synthesis layer*. Raw sources live in `../raw/`.
> Agents read raw, compile into the wiki, and from then on read the wiki.
> Pattern reference: [Karpathy, LLM Wiki (2026)](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).

---

## How this wiki is organized

```
wiki/
├── INDEX.md           ← you are here
├── entities/          ← one page per concrete thing (person, system, contract, product...)
├── topics/            ← one page per cross-cutting theme (synthesis across sources)
└── decisions/         ← one page per architectural decision (ADR format)
```

**Rules:**

- Every page has YAML frontmatter (title, type, last_updated, sources).
- Cross-link generously using `[[wikilinks]]` (Obsidian-compatible) or relative markdown links.
- When sources disagree, the page records the disagreement explicitly — don't silently pick a side.
- When a fact becomes stale, flag it with `> ⚠️ STALE: <reason>` rather than deleting it.

---

## Entities

> One page per concrete, identifiable thing. People, products, contracts, systems, datasets, organizations.

<!-- Agents: add new entity pages to entities/ and link them here. Keep this list alphabetical. -->

*(empty — add entities as they appear in your raw sources)*

---

## Topics

> One page per synthesized theme that cuts across multiple sources. This is where the compounding happens.

<!-- Agents: add new topic pages to topics/ and link them here. -->

*(empty — add topics as patterns emerge)*

---

## Decisions

> Architectural Decision Records. One page per decision that future-you (or a new team member, or an auditor) will need to understand.

<!-- Agents: add new ADRs to decisions/ and link them here in reverse chronological order. -->

*(empty — see [`../templates/ADR.md`](../templates/ADR.md) for the format)*

---

## Open questions

> Things this wiki does not yet have answers for. The LLM agent should flag these when compiling and propose updates when new sources arrive.

*(empty)*

---

## Contradictions and gaps

> When raw sources disagree, the disagreement is recorded here with pointers to the conflicting pages. Resolution is a human decision.

*(empty)*

---

## Recently updated

> The LLM agent should append the last 10 updates here when compiling new sources. Oldest entries fall off.

*(empty)*

---

## For the LLM agent

When you receive a new source to compile:

1. Read this `INDEX.md` first.
2. Read `../policy/AI_POLICY.md` to know what you may and may not do.
3. Identify the entities and topics the new source touches.
4. For each, update the relevant page (create it if missing, using the templates in `../templates/`).
5. If the new source contradicts existing content, **do not silently overwrite**. Add the contradiction to the relevant page and to the "Contradictions and gaps" section above.
6. Update the "Recently updated" section.
7. Never modify files in `../raw/`. They are immutable.

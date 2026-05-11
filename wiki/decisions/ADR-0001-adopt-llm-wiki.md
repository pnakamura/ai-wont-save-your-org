---
type: decision
id: ADR-0001
date: 2026-05-11
status: accepted
deciders: ["Example Lead"]
supersedes: []
superseded_by: []
---

# ADR-0001: Adopt the LLM Wiki pattern for organizational knowledge

> A worked example. Delete or rewrite once you have a real first decision to record.

## Context

The team needs a way to make AI-driven knowledge work compound over time, rather than re-deriving synthesis on every query. Standard RAG retrieves chunks from raw documents but never builds a persistent, organized view of what we collectively know. Without a synthesis layer, contradictions go undetected, onboarding stays painful, and AI answers vary between sessions.

## Decision

> We will adopt the LLM Wiki pattern (Karpathy, 2026) as our primary knowledge architecture. Raw sources go in `raw/` (immutable); a compiled markdown wiki lives in `wiki/`. LLM agents compile new sources into the wiki using the workflow defined in `.claude/skills/wiki-compiler/SKILL.md`.

## Alternatives considered

- **Pure RAG over raw documents.** Rejected: re-derives synthesis on every query, doesn't compound, hides contradictions.
- **Centralized wiki maintained by humans.** Rejected: humans don't maintain it, it goes stale, it becomes a graveyard.
- **Vector DB + chat interface.** Rejected: solves retrieval but not synthesis; same problem as pure RAG with extra infrastructure.

## Consequences

### Positive

- Knowledge compounds. Each new source enriches the synthesis rather than just being indexed.
- AI answers are consistent across sessions because they read from the same compiled view.
- Audit trail is preserved: every wiki claim points to a raw source.
- New team members can read the wiki and onboard faster.

### Negative

- Requires discipline: agents must always update the wiki after compiling.
- Markdown-only approach won't scale past ~100 documents without retrieval enhancements.
- Initial setup is empty — value compounds slowly, not instantly.

### Neutral / open

- Tooling choice (Claude Code vs. other agents) is replaceable; the pattern is not.

## Links

- Source(s): `../../raw/2026-05-11_example-kickoff-notes.md` (this example was seeded from a hypothetical kickoff)
- External: [Karpathy LLM Wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- Related: [[example]] [[example-topic]]

---

*Replace this example with your first real ADR. The format scales from trivial decisions to architecture-defining ones.*

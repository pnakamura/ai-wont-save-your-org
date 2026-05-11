# Example Kickoff Notes — 2026-05-11

> This is an example raw source. Delete it once you have real sources.
>
> It exists so the example wiki pages have something concrete to cite. Read this, then read `../wiki/entities/example.md`, `../wiki/topics/example.md`, and `../wiki/decisions/ADR-0001-adopt-llm-wiki.md` to see how a raw source becomes compiled knowledge.

## Attendees

- Example Lead (project owner)
- Example Reviewer (eval custodian)

## Discussion

The team agreed to adopt the LLM Wiki pattern proposed by Karpathy (2026) as the primary knowledge architecture for this initiative. The reasoning was that standard RAG-only approaches re-derive synthesis on every query, do not surface contradictions, and produce inconsistent answers across sessions.

Three concrete steps were agreed:

1. Establish a raw/ folder for immutable source material.
2. Establish a wiki/ folder for compiled synthesis.
3. Adopt the ADR format for decisions of any architectural weight.

The project officially started on 2026-05-11.

## Open items

- Success measurement beyond the first quarter is not yet defined.
- A production owner has not been named — the example lead is currently filling both roles.

## Next steps

- Compile this note into the wiki.
- Set up the eval skeleton with at least one baseline test case.
- Schedule a review at the 30-day mark.

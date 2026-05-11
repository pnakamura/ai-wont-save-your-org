---
name: wiki-compiler
description: Compiles raw sources into the structured wiki layer of this repository, following the Karpathy LLM Wiki pattern. Use this skill whenever a new file appears in raw/, or when the user asks to "integrate", "compile", "ingest", or "process" a source into the wiki. Use it also when the user asks to query the wiki — read the wiki first, only fall back to raw if needed.
---

# Wiki Compiler

This skill instantiates the LLM Wiki pattern (Karpathy, 2026) for this repository. The repo separates **raw sources** (immutable) from a **compiled wiki** (synthesis), and this skill maintains the wiki.

## When to use this skill

- A new file appeared in `raw/` and the user wants it integrated.
- The user pastes content and asks you to "add this to the wiki" or "integrate this source."
- The user asks a question about the domain — read the wiki first, then raw if needed.
- The user asks to audit the wiki for staleness, contradictions, or missing entities.

## When not to use this skill

- The user is asking a general question unrelated to the repo's domain. Answer directly.
- The user wants you to modify `raw/` files. Refuse — raw is immutable. Suggest creating a new raw file with the new information instead.
- The user wants to skip the wiki and answer purely from raw. Politely push back: the wiki exists precisely so we don't re-derive synthesis on every query.

## The compile workflow

When integrating a new raw source:

1. **Read `wiki/INDEX.md`.** It is the canonical map. Never skip this step.
2. **Read `policy/AI_POLICY.md` and `policy/DATA_HANDLING.md`** if this is the first compile in this session.
3. **Read the new source in full** from `raw/`.
4. **Identify what the source touches:**
   - Which **entities** does it mention? (people, products, contracts, systems, datasets)
   - Which **topics** does it inform? (cross-cutting themes)
   - Does it imply or document a **decision**? (then it deserves an ADR)
5. **Update existing pages** rather than creating new ones when possible. The wiki compounds; new pages dilute.
6. **Create new pages** using the templates in `templates/` when no existing page fits.
7. **For every fact extracted, cite the source.** Pages without source citations are not trustworthy.
8. **Flag contradictions explicitly.** If the new source disagrees with what the wiki already says:
   - Do **not** silently overwrite.
   - Record both claims on the relevant page under "Contradictions across sources."
   - Add an entry under "Contradictions and gaps" in `INDEX.md`.
9. **Update the INDEX:**
   - Add new entities/topics/decisions to their lists.
   - Append to "Recently updated" (newest first; trim to 10).
10. **Stop and report.** Show the user a summary: what was created, what was updated, what contradictions were flagged. Do not chain into another compile without confirmation.

## The query workflow

When the user asks a domain question:

1. **Read `wiki/INDEX.md`** to orient.
2. **Read the relevant topic and entity pages.** Synthesize from them.
3. **Only fall back to `raw/`** if the wiki has a gap. If you do this, note it explicitly: *"The wiki doesn't cover this yet; pulling from raw/X."*
4. **If a fall-back to raw revealed a gap, propose updating the wiki.** Don't just answer — suggest the compile.
5. **Cite sources by file path.** `wiki/entities/foo.md` and `raw/2026-05-bar.md` are the kind of citations that make answers auditable.

## Hard rules

- **Never write to `raw/`.** Not to fix typos. Not to add metadata. Never.
- **Never delete a wiki page.** If something is wrong, mark it stale: `> ⚠️ STALE: <reason>`.
- **Never invent sources.** If a claim is not in raw, do not pretend it is. Mark it as a hypothesis.
- **Never silently resolve a contradiction.** Surface it; let the human decide.
- **Respect the policy.** If the source contains data classified above what your tool is approved for, stop and ask. See `policy/DATA_HANDLING.md`.

## Output format for compile operations

After compiling, report in this format:

```
Compiled: raw/<filename>

Entities updated:
  - wiki/entities/<name>.md  (+<new info>)
  - wiki/entities/<name>.md  (created)

Topics updated:
  - wiki/topics/<name>.md  (+<new info>)

Decisions:
  - none / wiki/decisions/ADR-NNNN.md (created)

Contradictions flagged:
  - <description> (recorded in wiki/topics/<name>.md and INDEX.md)

Open questions:
  - <description>
```

This format is parseable, auditable, and short. It is the right level of detail.

## Why this skill exists

The default behavior of an LLM agent given a folder of documents is to re-derive everything on every query. That is the failure mode this repo is designed to prevent. Your job is to make the wiki the system of record, the raw folder the audit trail, and your own work the compilation step between them.

The wiki is the moat. Build it carefully.

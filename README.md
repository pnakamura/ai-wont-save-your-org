# AI Won't Save Your Org — Starter Kit

> Companion repository to the article [*AI Won't Save Your Org*](https://gist.github.com/YOUR-GIST-URL).
>
> **A minimal, opinionated scaffold for the three things that actually predict AI success in organizations: knowledge, evaluation, and governance.**

This is not a framework. It is not a library. It is a set of empty rooms with the furniture arranged correctly. You bring the content; the structure stops you from making the same mistakes everyone else does.

---

## What's in here

```
.
├── wiki/              ← the compiled knowledge layer (Karpathy's LLM Wiki pattern)
│   ├── INDEX.md       ← canonical entry point; the LLM and humans both read this
│   ├── entities/      ← people, products, contracts, systems — one page each
│   ├── topics/        ← synthesized themes that cut across sources
│   └── decisions/     ← architectural decision records (ADRs)
│
├── raw/               ← immutable source material — agents read, never write
│   └── README.md      ← what belongs here and what doesn't
│
├── evals/             ← the bar that separates "ships" from "vibes"
│   ├── README.md      ← the eval philosophy
│   ├── datasets/      ← held-out test cases
│   └── results/       ← timestamped runs
│
├── policy/            ← the rules of the road
│   ├── AI_POLICY.md       ← what the org allows, requires, and forbids
│   ├── DATA_HANDLING.md   ← what data goes where, and what cannot leave
│   └── INCIDENT.md        ← what to do when AI gets it wrong
│
├── templates/         ← copy-paste starters
│   ├── ADR.md         ← architectural decision record
│   ├── ENTITY.md      ← wiki entity page
│   ├── TOPIC.md       ← wiki topic page
│   ├── EVAL_CASE.md   ← single eval test case
│   └── USE_CASE.md    ← AI use case proposal
│
├── scripts/           ← small utilities, not infrastructure
│   ├── wiki_size.sh   ← are you above the "RAG threshold"?
│   └── validate.sh    ← sanity-check the wiki structure
│
└── .claude/           ← Claude Code integration (optional)
    └── skills/wiki-compiler/SKILL.md
```

**Everything is plain markdown.** No build step. No database. The whole repo is a folder you can browse on GitHub, clone into Obsidian, or hand to an LLM agent.

---

## The five-minute start

1. **Clone or fork this repo.** Rename it to fit your context (`acme-knowledge-base`, `program-x-wiki`, whatever).
2. **Read [`wiki/INDEX.md`](wiki/INDEX.md).** It's the canonical map.
3. **Read [`policy/AI_POLICY.md`](policy/AI_POLICY.md)** and adapt it. Don't skip this. A 1-page policy is infinitely better than a 50-page policy nobody reads.
4. **Drop a real document into `raw/`.** A meeting transcript, a contract, a design doc — anything.
5. **Have your LLM agent compile it into the wiki.** If you use Claude Code, the skill at `.claude/skills/wiki-compiler/SKILL.md` does this for you. With any other agent, paste the Karpathy [LLM Wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) plus this repo's `wiki/INDEX.md` and ask it to integrate the new source.
6. **Write one eval case in `evals/datasets/`** using the template. One is enough to start.

That's it. You now have what 95% of orgs doing AI don't: a compiled knowledge layer, a policy, and a measurement bar.

---

## Design principles

These are stolen, distilled, and not original. They are also non-negotiable if you want this to work.

1. **Compile, don't just retrieve.** The wiki is the synthesis layer. Agents read it; they don't reinvent it on every query. (Karpathy, *LLM Wiki*, 2026.)
2. **Raw is immutable.** Source material is sacred. Agents read `raw/`; they never write into it.
3. **The wiki is the moat.** Models are commodities. Your organization-specific synthesis is not.
4. **Markdown + filesystem are enough.** Resist the urge to add a database, a graph layer, or a vector store until you have proven you need it. (You probably don't, below ~100 documents.)
5. **Evals before model upgrades.** A crappy eval beats a great vibe.
6. **Governance is a plane, not a checkbox.** It cuts across every layer.
7. **Human-in-the-loop for anything that matters.** If a decision has fiduciary, contractual, or regulatory weight, the AI prepares; humans decide.

---

## Stack compatibility

This repo is **stack-agnostic by default**. It assumes:

- A filesystem.
- Markdown files.
- An LLM agent capable of reading and writing files.

That's it. It works with Claude Code, Cursor, Codex, Cline, OpenCode, or any other agent that can edit files. The optional `.claude/` folder contains a Claude Code skill that automates the wiki-compilation workflow; ignore it if you use something else.

---

## What this repo is *not*

- **Not a product.** There's nothing to install.
- **Not a tutorial on LLMs.** Read [Karpathy's gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) first if the LLM Wiki idea is new to you.
- **Not exhaustive.** It is deliberately minimal. Add what your domain needs; don't expect this repo to anticipate it.
- **Not a replacement for thinking.** It's a scaffold. The hard work — defining what matters, curating sources, writing evals — is still yours.

---

## Contributing

Forks are more valuable than stars. If you adapt this for your domain (legal, healthcare, public sector, fintech), open a PR with a `domains/your-domain/` folder showing the deltas. The goal is a small library of well-curated adaptations, not a monolith.

---

## License

MIT. Take it, modify it, ship it. Attribution appreciated but not required.

---

*Companion to the article "AI Won't Save Your Org." If this saved you a quarter of wasted AI spend, that's the point.*

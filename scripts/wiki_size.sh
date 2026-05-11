#!/usr/bin/env bash
# wiki_size.sh
#
# Reports the size of the wiki layer in pages and approximate tokens.
# Useful for deciding whether you still fit in the "wiki-before-RAG" regime
# (~100 documents or ~80k tokens, per Karpathy's LLM Wiki note).
#
# Usage: ./scripts/wiki_size.sh [path-to-wiki]

set -euo pipefail

WIKI_DIR="${1:-wiki}"

if [[ ! -d "$WIKI_DIR" ]]; then
  echo "Directory not found: $WIKI_DIR" >&2
  exit 1
fi

PAGES=$(find "$WIKI_DIR" -type f -name "*.md" | wc -l | tr -d ' ')
WORDS=$(find "$WIKI_DIR" -type f -name "*.md" -exec cat {} + | wc -w | tr -d ' ')

# Rough heuristic: 1 token ≈ 0.75 words for English markdown.
TOKENS=$(( WORDS * 4 / 3 ))

echo "Wiki size report — $WIKI_DIR"
echo "----------------------------------------"
echo "  Pages:           $PAGES"
echo "  Words:           $WORDS"
echo "  Approx tokens:   $TOKENS"
echo ""

if (( PAGES < 100 && TOKENS < 80000 )); then
  echo "✅ You are in the 'wiki-before-RAG' regime."
  echo "   An LLM can read the whole wiki directly. No vector DB needed."
elif (( TOKENS < 200000 )); then
  echo "⚠️  Borderline. Consider:"
  echo "   - Keeping the INDEX.md and topic pages compact"
  echo "   - Letting the LLM read on demand rather than always loading everything"
  echo "   - Starting to think about retrieval for entity pages"
else
  echo "🚨 You have outgrown the read-the-whole-wiki regime."
  echo "   Time to introduce retrieval (RAG) over the wiki itself, not over raw."
  echo "   The wiki remains the compiled synthesis layer; RAG just helps you fetch from it."
fi

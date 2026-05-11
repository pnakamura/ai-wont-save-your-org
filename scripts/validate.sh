#!/usr/bin/env bash
# validate.sh
#
# Sanity checks for the repo structure:
#   - All wiki pages have YAML frontmatter
#   - No file in wiki/ references a raw file that doesn't exist
#   - INDEX.md exists and is non-empty
#
# Not exhaustive. The goal is to catch the obvious things, not to be a full linter.
#
# Usage: ./scripts/validate.sh

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WIKI="$ROOT/wiki"
RAW="$ROOT/raw"
ERRORS=0

echo "Validating repo at $ROOT"
echo "----------------------------------------"

# 1. INDEX exists
if [[ ! -s "$WIKI/INDEX.md" ]]; then
  echo "❌ wiki/INDEX.md is missing or empty"
  ERRORS=$((ERRORS+1))
else
  echo "✅ wiki/INDEX.md present"
fi

# 2. Every wiki/*.md file (except INDEX) has frontmatter
echo ""
echo "Checking frontmatter..."
MISSING_FM=0
while IFS= read -r -d '' file; do
  # Skip INDEX itself; it doesn't need frontmatter
  if [[ "$(basename "$file")" == "INDEX.md" ]]; then continue; fi
  # First line should be ---
  first_line=$(head -n 1 "$file")
  if [[ "$first_line" != "---" ]]; then
    echo "  ❌ Missing frontmatter: ${file#$ROOT/}"
    MISSING_FM=$((MISSING_FM+1))
  fi
done < <(find "$WIKI" -type f -name "*.md" -print0)

if (( MISSING_FM == 0 )); then
  echo "✅ All wiki pages have frontmatter"
else
  ERRORS=$((ERRORS+MISSING_FM))
fi

# 3. References to raw/ should resolve
echo ""
echo "Checking raw/ references..."
BROKEN_REFS=0
while IFS= read -r -d '' file; do
  # Find references like ../raw/something or raw/something
  while IFS= read -r ref; do
    # Skip references that point only to the directory itself
    if [[ "$ref" == "../raw/" ]]; then continue; fi
    # Normalize: strip leading ../ until we have raw/...
    norm="${ref#../}"
    norm="${norm#./}"
    target="$ROOT/$norm"
    if [[ ! -e "$target" ]]; then
      echo "  ⚠️  Broken raw reference in ${file#$ROOT/}: $ref"
      BROKEN_REFS=$((BROKEN_REFS+1))
    fi
  done < <(grep -oE '\.\./raw/[A-Za-z0-9_./-]*' "$file" 2>/dev/null || true)
done < <(find "$WIKI" -type f -name "*.md" -print0)

if (( BROKEN_REFS == 0 )); then
  echo "✅ All raw/ references resolve"
else
  echo "   ($BROKEN_REFS broken references — warning, not error)"
fi

# 4. Summary
echo ""
echo "----------------------------------------"
if (( ERRORS == 0 )); then
  echo "✅ Validation passed."
  exit 0
else
  echo "❌ Validation failed: $ERRORS issue(s)"
  exit 1
fi

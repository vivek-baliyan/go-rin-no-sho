#!/bin/bash
# Mechanical subset of house-style.md §12 (Void's verification checklist).
# Run before Void's manual read — this catches the countable stuff so the manual
# read can focus on the three items that need judgment:
#   - every number sourced or marked (needs checking the claim ledger)
#   - version pins present (needs knowing what "verified against X.Y.Z" means here)
#   - "a stranger could follow it start to finish" (pure judgment)
#
# ponytail: sentence/paragraph/word splitting below is regex-based, not a real
# parser — false positives on abbreviations, decimals, or unusual markdown are
# possible. Treat every FAIL as "go look", not as gospel.
#
# Usage: check-house-style.sh <publish-file.md>

set -u
file="${1:?usage: check-house-style.sh <publish-file.md>}"
overall_fail=0

say_pass() { printf 'PASS: %s\n' "$1"; }
say_fail() { printf 'FAIL: %s\n' "$1"; overall_fail=1; }

# Blank out fenced code blocks and [Visual break: ...] placeholders so prose checks
# don't trip on code or on author-facing image notes. Blanked (not deleted) so grep
# line numbers still match the file. Identifier/metadata checks below deliberately
# run on the whole file instead — house-style bans those everywhere, code included.
prose="$(awk '
  /^```/ { infence = !infence; print ""; next }
  infence || /^\[Visual break:/ { print ""; next }
  { print }
' "$file")"

# 1. Anti-gatekeeping words (house-style §3)
gatekeeping_hits="$(printf '%s\n' "$prose" | grep -inE '\b(obviously|simply|just|clearly|as everyone knows|basic|easy)\b' || true)"
if [ -n "$gatekeeping_hits" ]; then
  say_fail "anti-gatekeeping words found:"$'\n'"$gatekeeping_hits"
else
  say_pass "no anti-gatekeeping words"
fi

# 2. No semicolons (house-style §2)
semicolon_hits="$(printf '%s\n' "$prose" | grep -n ';' || true)"
if [ -n "$semicolon_hits" ]; then
  say_fail "semicolons found:"$'\n'"$semicolon_hits"
else
  say_pass "no semicolons"
fi

# 3. Code fences have a language identifier (house-style §5)
bad_fence_lines="$(awk '
  /^```/ {
    if (!infence) {
      infence = 1
      lang = $0
      sub(/^```/, "", lang)
      if (lang == "") print NR
    } else {
      infence = 0
    }
  }
' "$file")"
if [ -n "$bad_fence_lines" ]; then
  say_fail "code fence(s) missing a language identifier at line(s): $(printf '%s' "$bad_fence_lines" | paste -sd, -)"
else
  say_pass "all code fences have a language identifier"
fi

# 4. Sentence (<=25 words) and paragraph (<=3 sentences) limits (house-style §2)
para_report="$(printf '%s\n' "$prose" | awk '
  BEGIN { RS=""; FS="\n" }
  {
    para = $0
    if ($1 ~ /^#/ || $1 ~ /^([-*>]|[0-9]+\.) / || para ~ /\|/) next
    gsub(/\n/, " ", para)
    gsub(/  +/, " ", para)
    n = split(para, sentences, /[.!?]+ +/)
    if (n > 0 && sentences[n] == "") n--
    if (n > 3) print "paragraph exceeds 3 sentences (" n "): " substr(para, 1, 70) "..."
    for (i = 1; i <= n; i++) {
      wc = split(sentences[i], words, /[ \t]+/)
      if (wc > 25) print "sentence exceeds 25 words (" wc "): " substr(sentences[i], 1, 70) "..."
    }
  }
')"
if [ -n "$para_report" ]; then
  say_fail "sentence/paragraph limits violated:"$'\n'"$para_report"
else
  say_pass "sentences and paragraphs within house-style limits"
fi

# 5. Zero internal metadata (house-style §10) — working-file markers that must
#    never survive into the publish file.
metadata_hits="$(grep -nE '\{"(warning|context|confidence)"' "$file" || true; grep -n 'INTERNAL SCAFFOLDING' "$file" || true)"
if [ -n "$metadata_hits" ]; then
  say_fail "internal metadata leaked into publish file:"$'\n'"$metadata_hits"
else
  say_pass "no internal metadata markers found"
fi

# 6. No ticket IDs / absolute paths / emails / commit-hash-like strings anywhere
#    (house-style §11) — checked on the whole file, code included.
ticket_hits="$(grep -nE '\b[A-Z]{2,}-[0-9]+\b' "$file" || true)"
path_hits="$(grep -nE '(/Users/|/home/)[A-Za-z0-9_./-]*' "$file" || true)"
email_hits="$(grep -nE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' "$file" || true)"
hash_hits="$(grep -nE '\b[0-9a-f]{8,40}\b' "$file" || true)"
identifier_fail=0
for entry in "ticket IDs|$ticket_hits" "absolute paths|$path_hits" "email addresses|$email_hits" "commit-hash-like hex strings|$hash_hits"; do
  label="${entry%%|*}"
  hits="${entry#*|}"
  if [ -n "$hits" ]; then
    say_fail "$label found:"$'\n'"$hits"
    identifier_fail=1
  fi
done
[ "$identifier_fail" -eq 0 ] && say_pass "no ticket IDs, absolute paths, emails, or commit-hash-like strings found"

# 7. Title rules (house-style §8): 8-14 words, under 80 characters.
title_line="$(grep -m1 '^# ' "$file" || true)"
if [ -z "$title_line" ]; then
  say_fail "no H1 title line found"
else
  title="${title_line#\# }"
  title_words="$(printf '%s' "$title" | wc -w | tr -d ' ')"
  title_chars="${#title}"
  if [ "$title_words" -ge 8 ] && [ "$title_words" -le 14 ] && [ "$title_chars" -lt 80 ]; then
    say_pass "title within 8-14 words and under 80 chars ($title_words words, $title_chars chars)"
  else
    say_fail "title out of range: $title_words words, $title_chars chars -- \"$title\""
  fi
fi

# 8. At least one visual-break marker present (house-style §12)
if grep -q '\[Visual break:' "$file"; then
  say_pass "at least one [Visual break: ...] marker present"
else
  say_fail "no [Visual break: ...] marker found"
fi

exit "$overall_fail"

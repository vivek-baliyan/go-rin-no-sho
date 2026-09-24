#!/bin/bash
# Self-check for check-house-style.sh: one good fixture (must pass clean), one
# bad fixture (must trip every mechanical check). No framework, just fixtures.

set -u
dir="$(cd "$(dirname "$0")" && pwd)"
checker="$dir/check-house-style.sh"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
fails=0

cat > "$tmp/good.md" <<'EOF'
# Debounce Timers Save Retries Without Losing the Last Call

So debounce logic quietly drops the last event if you don't handle max wait.

Here's the fix in one committed pass.

```javascript
function debounce(fn, wait) {
  return fn
}
```

[Visual break: a timeline showing dropped vs delivered calls]

1. Does the stream have a quiet point?
2. Can a restart lose the timer?
3. Can two callers race?
4. Can an old run land last?

[Visual break: a long placeholder note for the author that runs well past the twenty-five word sentence limit; it also carries a semicolon, and neither should count as prose]
EOF

cat > "$tmp/bad.md" <<'EOF'
# Fix

Obviously this is simply the easy fix; just trust me.

```
function debounce(fn, wait) {
  return fn
}
```

See /Users/dev/project/notes.md and ticket ABC-123.
Contact dev@example.com for questions.
{"warning": "leaked scaffolding marker"}
EOF

good_out="$("$checker" "$tmp/good.md")"; good_rc=$?
if [ "$good_rc" -ne 0 ]; then
  echo "TEST FAIL: good.md should pass clean (exit 0), got $good_rc"
  echo "$good_out"
  fails=1
else
  echo "TEST PASS: good.md passes every mechanical check"
fi

bad_out="$("$checker" "$tmp/bad.md")"; bad_rc=$?
if [ "$bad_rc" -eq 0 ]; then
  echo "TEST FAIL: bad.md should fail, got exit 0"
  fails=1
else
  for needle in "anti-gatekeeping" "semicolon" "language identifier" \
                "title out of range" "no [Visual break" "internal metadata" \
                "ticket IDs" "absolute paths" "email addresses"; do
    if ! printf '%s' "$bad_out" | grep -qF "$needle"; then
      echo "TEST FAIL: expected bad.md output to mention '$needle', it didn't"
      echo "$bad_out"
      fails=1
    fi
  done
  [ "$fails" -eq 0 ] && echo "TEST PASS: bad.md trips every mechanical check"
fi

exit "$fails"

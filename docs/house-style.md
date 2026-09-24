# House Style — The Author's Law

The single style authority for every scroll and disciple. Scrolls load this before
acting; disciples inherit it from their scroll's dispatch brief. Install copies this
file to `.claude/house-style.md` in the writing project.

## 1. Audience & level

- Write to a smart beginner: assume intelligence, not knowledge.
- Define jargon on first use, or don't use it.
- Target grade-6 reading level (Hemingway check) without dumbing down the content.

## 2. Prose rules

- Sentences ≤ 25 words (aim 15–20). Paragraphs ≤ 3 sentences.
- Active voice. Contractions on (you're, we'll, it's).
- "So" and "But" to open, not "Therefore" / "However".
- Oxford comma always. US punctuation (commas/periods inside quotes).
- Em dash (—) for emphasis, not hyphen. Max one exclamation point per article.
- Numbers: spell out 0–9 ("five approaches"), numerals 10+ ("15 metrics"),
  numerals for measurements ("5ms", "68%", "$8,000").

## 3. Anti-gatekeeping word list — never use

"obviously", "simply", "just", "clearly", "as everyone knows", "basic", "easy".
No absolutist claims ("always", "never", "best") without evidence.

## 4. Uncertainty markers

Context-bound, version-bound, or untested claims carry JSON markers, inline:

```json
{"context": "Tested in .NET 10, may differ in other runtimes"}
{"warning": "Preview version — behavior may change"}
{"confidence": 0.7, "basis": "Research from 4 credible sources"}
```

## 5. Code standards

- Fenced code blocks always with a language identifier.
- Tested code only — never ship unrun examples.
- Meaningful variable names; comments explain decisions, not syntax.
- Chunks ≤ ~30 lines; explain after the block, not before.
- No images of code. Ever.

## 6. Metrics

- Units always ("5ms", not "fast"). Before/after always ("from 2.3s to 180ms").
- Business impact where it exists ("saved $50K annually").

## 7. Author voice (verbatim — the author's own patterns)

- Openers: "When our metric started drifting, I wanted to understand why…",
  "I decided to investigate [topic] because…", "Here's what the data revealed…".
- Methodology: "I tested this by measuring X, Y, and Z…", "Here's exactly how
  I set up the investigation…".
- Honest failure: "My first attempt made things worse — here's why…",
  "What I wish someone had told me…".
- Evidence language: Production path ("In our production environment…"),
  Research path ("I investigated using these sources…"), Analysis path
  ("I analyzed these approaches…"). Name the path; never blur opinion into data.
- Authority context (author bio territory, not agent persona): senior .NET/React
  production experience, Azure, AI integration in production.

## 8. Title rules

- Specific and concrete; put the technology in the title. No clickbait.
- State the outcome or the surprise, not the topic ("Your EF Core ExecuteUpdate
  Worked — Then SaveChanges Undid It", not "Introduction to ExecuteUpdate").

## 9. Format library (wenxin chooses from these)

Every recipe = FCC base (everything above) + a section skeleton:

- `pure-fcc` — Hook (scenario) → Why this happens → Safe patterns →
  Decision card → Conclusion → one-line italic CTA.
- `fcc-feynman` — Simple explanation → Where it breaks (numbered, with code) →
  Rebuild → Quick reference (save this) → Check yourself → Conclusion.
- `fcc-socratic` — Each section = the question a senior dev actually asks →
  evidence answer → next question falls out of the answer.
- `fcc-inversion` — "Here's how this fails" → each failure mode → the defense.
- `fcc-nyaya` — Thesis → Reason → Example → Application → Conclusion.

## 10. Output conventions

- **Working file** (Fire/Wind stage): internal. Keeps scaffolding — topic quality
  verdict, headline scores, check-yourself. Never published.
- **Publish file** (Void's deliverable): clean FCC article — H1 + subtitle line,
  cold open with code in the first screen, H2 sections, decision card, one-line
  italic closing CTA. **Zero internal metadata.**

## 11. Verification checklist (Void's final read)

- [ ] No anti-gatekeeping words. [ ] Every number sourced or marked.
- [ ] Version pins present. [ ] Code blocks have language identifiers.
- [ ] Sentences/paragraphs within limits. [ ] Publish file has zero internal metadata.
- [ ] Title follows title rules. [ ] A stranger could follow it start to finish.

# House Style — The Author's Law

The single style authority for every scroll and disciple. Scrolls load this before
acting; disciples inherit it from their scroll's dispatch brief. Install copies this
file to `.claude/house-style.md` in the writing project.

## 0. Non-negotiables — never, no exceptions

- **Never fabricate a citation, benchmark, version number, or quote.** An unverifiable
  claim is a `{"warning": ...}` marker or a flagged finding — never a plausible-sounding
  guess. This is the one rule every downstream agent (pramana, manana, mingshi, zhijian)
  enforces against every upstream agent's output, no exceptions for deadline pressure.
- **Never send the working file, its claim ledger, or any draft externally** before the
  author has approved the publish file. WebSearch/WebFetch are for reading public sources,
  not for posting this project's unpublished content anywhere.
- **Never let a privacy-stripping violation (house-style §11) survive past Void.** If
  it's ambiguous whether a detail identifies the employer, the product, or a person, it
  gets genericized — the default on ambiguity is stricter, not looser.

## 1. Audience & level

- Write to a smart beginner: assume intelligence, not knowledge.
- Define jargon on first use, or don't use it.
- Target grade-6 reading level (Hemingway check) without dumbing down the content.

## 2. Prose rules

- Sentences ≤ 25 words (aim 15–20). Paragraphs ≤ 3 sentences; single-sentence
  paragraphs are fine.
- Active voice. Contractions on (you're, we'll, it's). No semicolons — break into
  separate sentences instead.
- "So" and "But" to open, not "Therefore" / "However".
- Oxford comma always. US punctuation (commas/periods inside quotes), American
  spelling (analyze, color).
- Em dash (—) for emphasis, not hyphen. Max one exclamation point per article.
- Numbers: spell out one through ten ("five approaches"), numerals for 11+
  ("15 metrics"), numerals for measurements ("5ms", "68%", "$8,000").

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

## 7. Author voice (verbatim — the author's own patterns; a house addition on top
of FCC base, not an FCC rule itself — FCC leaves person/perspective unrestricted)

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
- 8–14 words, under 80 characters (FCC: more social shares, no truncation).
  No "part 1"-style labels — they scare readers off.

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
  verdict, headline scores, check-yourself, and a **claim ledger**: one row per
  factual/numeric claim, columns `claim | source | tier | stage graded`. Tier is
  pramana's Tier 1 (official docs/peer-reviewed/standards) / Tier 2 (major
  engineering blogs, industry reports) / Tier 3 (community posts, tutorials)
  scale — whichever stage grades a claim first writes the tier; later stages
  carry the tag forward instead of re-grading blind, so a claim's evidence
  quality survives gewu → pramana → manana → mingshi → sutra intact and
  checkably. Never published, never pasted externally.
- **Publish file** (Void's deliverable): clean FCC article — H1 + subtitle line,
  cold open with code in the first screen, H2 sections, decision card, one-line
  italic closing CTA. **Zero internal metadata.**

## 11. Privacy & confidentiality — publish file only

The working file's source citations (repo names, absolute paths, ticket IDs, exact
filenames) exist for fact-checking traceability and stay internal. None of the
following may survive into the publish file:

- Employer, product, or repo/service names — say "a production service," "the batch
  pipeline," "the API pod," not the real name.
- Ticket IDs (JIRA/Linear/etc.), PR numbers, commit hashes, or absolute file paths.
- Exact internal filenames — code shown is re-typed/paraphrased into a minimal
  illustrative snippet, not copied verbatim with its original filename or path.
- Employee names or emails, including the author's own employer-tied email — bio
  references stay role-generic ("a senior backend engineer").

The mechanism, the numbers, and the reasoning are the asset — carry all of that over.
Only the identifiers that point back to a specific company or person get genericized.

## 12. Verification checklist (Void's final read)

Run `.claude/scripts/check-house-style.sh <publish-file>` first — it checks every
`(script)` item below mechanically. Spend the manual read on the `(manual)` items only.

- [ ] No anti-gatekeeping words. `(script)`
- [ ] Every number sourced or marked. `(manual)`
- [ ] Version pins present. `(manual)`
- [ ] Code blocks have language identifiers. `(script)`
- [ ] Every claim in the ledger carries a tier tag from its originating stage —
      none re-derived or blank at the final read. `(manual` — the ledger lives in
      the working file, not the publish file the script reads`)`
- [ ] Sentences/paragraphs within limits, no semicolons. `(script)`
- [ ] Publish file has zero internal metadata. `(script)`
- [ ] No employer/repo/service name, ticket ID, commit hash, absolute path, internal
      filename, or employee name/email anywhere in the publish file. `(script` catches
      ticket IDs, absolute paths, emails, and hash-like strings; employer/repo/service
      names and exact filenames still need a manual look`)`
- [ ] Title follows title rules (8–14 words, under 80 characters). `(script)`
- [ ] A stranger could follow it start to finish. `(manual)`
- [ ] At least one `[Visual break: ...]` placeholder marker present — top of article
      plus roughly one per 400–500 words of code-dense section. No agent generates the
      actual image; the marker names what it should show so the author can fill it in.
      `(script` checks presence; the 400–500-word spacing is still a manual look`)`

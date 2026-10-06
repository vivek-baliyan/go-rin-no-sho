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
- **Never let a privacy-stripping violation (house-style §14) survive past Void.** If
  it's ambiguous whether a detail identifies the employer, the product, or a person, it
  gets genericized — the default on ambiguity is stricter, not looser.

## 1. Audience & level

- Audience: developers, software engineers, solution architects, and system
  designers, roughly 2 to 10+ years in.
- Define genuinely niche jargon on first use, or don't use it.
- Target grade-6 reading level (Hemingway check) without dumbing down the content.

## 2. Prose rules

- Sentences ≤ 25 words (aim 15–20). Paragraphs ≤ 3 sentences; single-sentence
  paragraphs are fine.
- Active voice. Contractions on (you're, we'll, it's). No semicolons — break into
  separate sentences instead.
- "So" and "But" to open, not "Therefore" / "However".
- Oxford comma always. US punctuation (commas/periods inside quotes), American
  spelling (analyze, color).
- No em dashes (—), no double hyphens (--), no spaced-hyphen dashes in article
  prose — these are AI-writing tells. Rewrite the sentence with a period, comma,
  colon, or parentheses instead. Exempt: diagram glyphs inside code blocks and
  data notation (+137/−15). Max one exclamation point per article.
- Numbers: spell out one through ten ("five approaches"), numerals for 11+
  ("15 metrics"), numerals for measurements ("5ms", "68%", "$8,000").

## 3. Anti-gatekeeping word list — never use

"obviously", "simply", "just", "clearly", "as everyone knows", "basic", "easy".
No absolutist claims ("always", "never", "best") without evidence.

## 4. Uncertainty markers

Context-bound, version-bound, or untested claims carry JSON markers, inline:

```json
{"context": "Tested in .NET 10, may differ in other runtimes"}
{"warning": "Preview version, behavior may change"}
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
  Worked, Then SaveChanges Undid It", not "Introduction to ExecuteUpdate").
- Hard limits: 8–14 words, under 80 characters, sentence case. No "part 1"-style
  labels — they scare readers off.

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
- `fcc-controversy` — Consensus (what everyone believes) → Investigation → Why the gap
  exists → What actually works → open discussion question. Only after passing the
  Viral Potential Gate (§12).
- `fcc-authority` — Study finding → Where real implementations diverge → Application →
  Metrics. Requires 3+ Tier-1 research sources, cited and linked.

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

## 11. Verification checklist (Void's final read)

Run `.claude/scripts/check-house-style.sh <publish-file>` first — it checks every
`(script)` item below mechanically. Spend the manual read on the `(manual)` items only.

- [ ] No anti-gatekeeping words. `(script)`
- [ ] Every number sourced or marked. `(manual)`
- [ ] Version pins present. `(manual)`
- [ ] No em dashes, double hyphens, or spaced-hyphen dashes in prose. `(script)`
- [ ] Code blocks have language identifiers. `(script)`
- [ ] Every claim in the ledger carries a tier tag from its originating stage —
      none re-derived or blank at the final read. `(manual` — the ledger lives in
      the working file, not the publish file the script reads`)`
- [ ] Sentences/paragraphs within limits, no semicolons. `(script)`
- [ ] Publish file has zero internal metadata. `(script)`
- [ ] No employer/repo/service name, ticket ID, commit hash, absolute path, internal
      filename, or employee name/email anywhere in the publish file. `(script` catches
      ticket IDs, absolute paths, emails, and hash-like strings; employer/repo/service
      names and exact filenames still need a manual look`; see §14)`
- [ ] Title follows title rules (8–14 words, under 80 chars). `(script)`
- [ ] Ending invites discussion. `(manual)`
- [ ] A stranger could follow it start to finish. `(manual)`
- [ ] At least one `[Visual break: ...]` placeholder marker present — top of article
      plus roughly one per 300–400 words of code-dense section (§12 Density). No agent
      generates the actual image; the marker names what it should show so the author
      can fill it in. `(script` checks presence; the spacing is still a manual look`)`

## 12. Engagement

- **Viral Potential Gate** — an article passes with at least 2 of 5: controversy gap
  (belief vs reality), a discussion-worthy question, challenges a common practice,
  surprising data/statistics, tribal division ("Team A vs Team B").
- **Controversy patterns** (score /10): "The 'Best Practice' That [negative outcome]"
  7–8 · "Why [community belief] Is Wrong (data included)" 8–9 · "[A] vs [B]: Why [B]
  Won (with data)" 6–7 · "The [problem] nobody talks about" 5–6.
- **Viral score** — four factors, each 1–10:
  - Controversy: 9–10 challenges consensus / tribal "Team A vs B" · 7–8 contrarian
    with data or "why we left" · 5–6 "when to use" debates · 1–2 consensus only.
  - Community Interest: 9–10 trending (1K+ discussions/24h) · 7–8 active (100+/24h) ·
    5–6 steady · 1–2 dormant.
  - Tribal Alignment: 9–10 "why we left X for Y" / "A vs B" · 7–8 identity signaling
    ("senior vs junior", "production vs tutorial") · 5–6 tech comparison · 1–2 none.
  - Data Availability: 9–10 production experience possible + multiple sources · 7–8
    docs + benchmarks · 5–6 moderate · 1–2 opinion only.
  - Score = (C × I × T × D)^¼. Bands: 8–10 strong · 6–7 good · 4–5 moderate ·
    <4 rework the angle, not the topic — add controversy, tribal, or data and re-score.
- **Comment-driving endings** (the closing CTA picks one): Hot Take [CE7 prior: ~28
  comments/2h] · Tribal Question [~22] · Data Discussion [~15] · Experience Question
  [~12] · Open Problem [~8].
- **Authenticity test** — controversy ships only with experience + data + nuance
  ("here's when it still works"). An absolutist claim without evidence is clickbait —
  cut it.
- **First paragraph** = Problem + Promise + Evidence Path in 3–4 sentences. Problem in
  the first 2 sentences. Banned hooks: blog intros ("In today's modern…", "Have you
  ever wondered…").
- **Density**: links ≤10–15 per 1,000 words (anchor 2–3 words, never "click here") ·
  a visual break every 300–400 words · target read time 5–8 minutes.
- **Memes** — a meme counts as a visual break. 1–2 per article, placed at a failure
  or punchline beat, never mid-explanation. The working file specs the concept
  (format + panel labels + caption); the image is placed at publish.
- **Medium SEO (publish-day pass)** — the subtitle is the meta description; keep it
  keyword-bearing. Resolve named sources to real URLs at publish (~8–10 outbound
  links, inside the density cap). Fill the 5 tags, the SEO title, and the SEO
  description fields. Keyword-bearing alt text on every image and meme. SERP shows
  ~60 chars — keyword and outcome must sit in the first 60.

## 13. Research channels

Try in order. When a channel fails or is quota-dead, fall down the ladder — never
silently skip a channel.

1. WebSearch (primary; quota-limited).
2. WebFetch direct URLs — official docs, changelogs, spec pages.
3. Context7 — version-pinned library docs.
4. zread — GitHub repos: docs, issues, release notes.
5. Microsoft Learn — .NET/Microsoft topics.
6. All web channels down → say so in the report and mark affected claims
   `{"warning": "unverified — research channel unavailable"}`. Never invent.

## 14. Privacy & confidentiality — publish file only

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

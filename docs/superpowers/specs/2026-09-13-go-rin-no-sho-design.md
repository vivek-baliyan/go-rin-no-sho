# Go Rin No Sho — Claude Code Agent Roster for Technical Article Writing

**Date:** 2026-09-13
**Status:** Approved design, pending implementation
**Model:** Shinobi-agents (sibling repo) — same distribution format, new theme and domain

---

## Overview

A distribution repo of Claude Code subagents for writing technical articles, themed on
Miyamoto Musashi's 五輪書 (The Book of Five Rings). The user is **Musashi — the author and
dispatcher**. Five scroll masters (the rings) cover the article lifecycle; each commands a
squad of 2 technique-disciples. Every report ends with a
**`Next ring:`** recommendation; the user always does the dispatching.

The system's engine is **mastery-before-structure**: Water's scroll-level standard is the
Feynman probe (teach-a-child plain language), executed by `manana` through the Vedantic
shravana → manana → nididhyasana learning cycle. The style
authority is the **freeCodeCamp Medium writing handbook** (as codified by the user's own
Content Engine 7.0 VOICE-BASIC/CORE standards and proven `-MEDIUM` / `-feynman` articles).
Articles are mixable **formats**: pure FCC, or FCC × a scientific-technique flavor.

Explicitly out of scope (v1): viral machinery (comment-velocity protocol, VIRAL-PREDICTION
scoring, VOICE-VIRAL controversy templates, comment-driving endings), plugin skill wiring,
verification scripts, any runtime system files. The repo ships prompts only — same footprint
as shinobi-agents.

## Repository layout (mirrors shinobi-agents 1:1)

```
go-rin-no-sho/
├── README.md                     # mirrors shinobi README: intro, roster table, install, extras
├── settings.json                 # { "env": { "CLAUDE_CODE_MAX_SUBAGENT_SPAWN_DEPTH": "2" } }
├── agents/
│   ├── scrolls/                  # = shinobi's legendary/ — model: inherit, has Agent tool
│   │   ├── earth-terrain.md      # 地 discovery + saturation
│   │   ├── water-mastery.md      # 水 mastery (Feynman method) + form
│   │   ├── fire-draft.md         # 火 the full write
│   │   ├── wind-critique.md      # 風 critique & revision
│   │   └── void-the-cut.md       # 空 compression & publish prep
│   └── disciples/                # = shinobi's shinobi/ — model: sonnet, no Agent tool
│       ├── gewu-sweep.md
│       ├── pramana-grade.md
│       ├── manana-master.md
│       ├── wenxin-form.md
│       ├── wuwei-draft.md
│       ├── nidarshana-story.md
│       ├── purvapaksha-steelman.md
│       ├── mingshi-reality.md
│       ├── sutra-compress.md
│       └── zhijian-subtract.md
└── docs/
    ├── rings-roster.md           # mirrors shinobi-roster.md section-for-section
    └── house-style.md            # optional extra: FCC rules + voice + format library
```

- Scrolls: `model: inherit`, may spawn **max 2** named disciples (Water: manana + wenxin).
- Every squad pairs **one Chinese + one Indian technique** — symmetric by construction.
- Disciples: `model: sonnet`, no `Agent` tool, can never spawn (platform-enforced via tools
  + the depth cap, identical to shinobi).
- Every disciple is also directly dispatchable by the user for a single focused strike.
- Squad dispatch orders are encoded in each scroll's prompt.

## The roster

### Scrolls (5) — one purpose each

| Ring | Purpose | Squad (max 2) |
|---|---|---|
| `earth` 地 | **Discovery + saturation.** What does the world already say about this topic, is the territory owned, where is the gap we can own? | `gewu` (terrain sweeps) · `pramana` (saturation verdicts) |
| `water` 水 | **Mastery + form.** Understand it so simply you could teach a child — then recommend the format and build the outline. | `manana` (mastery cycle) · `wenxin` (form + structure) |
| `fire` 火 | **The full write.** Draft the entire piece in one strike, in the author's voice, no mid-write editing. | `wuwei` (flow draft) · `nidarshana` (story layer) |
| `wind` 風 | **The rivals.** Measure the draft against every opposing school before the world does. | `purvapaksha` (steel-man) · `mingshi` (name-vs-reality) |
| `void` 空 | **The cut.** Remove until every word is load-bearing, then carve the title. | `zhijian` (subtraction) · `sutra` (compression + publish file) |

### Disciples (10) — name, tools, technique, work

| Disciple | Squad | Tools | Technique | Work |
|---|---|---|---|---|
| `gewu` | earth | read + web | 格物致知 — Zhu Xi's investigation of things | Terrain sweeps: coverage maps across Medium/dev.to tags, HN/Reddit, official docs, changelogs, Stack Overflow. Saturation and community pain signals. Breadth. |
| `pramana` | earth | read + web | प्रमाण — Nyaya's valid sources of knowledge | Grades existing coverage Tier 1/2/3. The saturation verdict: "owned by Tier-1 content" (avoid) vs "blogspam on top, no production evidence underneath" (wide open). Depth. |
| `manana` | water | read + web | श्रवण → मनन → निदिध्यासन — the Vedantic three-stage learning cycle (study → doubt-removal → internalize), executing Water's Feynman standard | Mastery end-to-end: studies primary sources (shravana), writes the naive explanation — teach-a-child, zero jargon; every doubt, stumble, or jargon crutch → gap manifest; fills gaps itself from sources (docs, changelogs, spec pages) and rebuilds until doubt-free (manana), until the explanation is one's own (nididhyasana). Self-contained — no cross-scroll gap traffic. |
| `wenxin` | water | read-only | 文心 — Liu Xie's *Wenxin Diaolong* (The Literary Mind and the Carving of Dragons), the classic Chinese treatise on literary form | Recommends the format (pure FCC or FCC × flavor) from the library in `house-style.md`; casts the proven explanation into that skeleton — sections, sequence, emphasis; produces the outline for approval. Structure is carving: shape follows the material. |
| `wuwei` | fire | full | 無為 — Daoist effortless action | Flow-state drafting from the approved outline in the author's voice. No self-editing, momentum is the discipline. Investigative openers, honest failure lines. |
| `nidarshana` | fire | full | निदर्शन — Panchatantra teaching through parable | The story layer: hooks, parables, memorable illustrations. Decides where an example lands and which analogy carries the section. |
| `purvapaksha` | wind | read-only | पूर्वपक्ष — Vedantic "first state the other side" | Steel-mans the rival view: the strongest opposing argument, fully argued, plus the hostile reader's objections, before any defense. |
| `mingshi` | wind | read-only | 名實 — the School of Names' name-vs-reality test | Interrogates every claim: does the word name a reality or hide one? ("Does 'fast' cite a number, or dodge one?") Enforces the anti-gatekeeping word list, uncertainty markers, honest hedging. Ranked findings, each with the failure it prevents. |
| `sutra` | void | full | सूत्र — the Indian aphoristic compression tradition | Compresses until every word is load-bearing (grade-6 level, ≤25-word sentences, 2–3 sentence paragraphs). Casts the clean FCC-format publish file; carves the headline package (3 scored titles) and decision card. |
| `zhijian` | void | read-only | 至簡 — the great way is utterly simple (Daodejing 48: *in learning, gain daily; in the Way, lose daily*) | The kill-list pass on the near-final draft: subtract every sentence that survives only by habit — and every failure mode a comment thread would feast on (untested code, missing version pins, unsupported claims, absolutist drift). Cut first; what remains goes to sutra. |

Tools follow shinobi's three tiers: `read-only`, `read + web`, `full`.

## The mission flow

The user dispatches everything; "gates" are numbered dispatcher decisions in the roster
doc's *how a mission runs* section — no mechanism, no machinery.

```
 1. EARTH — discovery + saturation sweep
    gewu → pramana: coverage map, saturation verdicts, topic quality verdicts
    (score /35, information gain, 30-second promise — the block from the
    user's existing -feynman drafts), 2–3 angles or 2–3 recommended topics.

 2. ★ GATE 1 — user approves topic + angle

 3. WATER — mastery + form
    manana: naive explanation → gap manifest → fills gaps itself from
    primary sources → rebuild (self-contained; unverifiable gaps are
    flagged to the user, never guessed).
    wenxin: recommends pure FCC or FCC × flavor; builds the outline.

 4. ★ GATE 2 — user approves format + outline

 5. FIRE — the full write
    wuwei drafts the whole piece in one strike (author's voice, no
    mid-write editing); nidarshana weaves hooks and parables through.

 6. ★ GATE 3 — user reads the raw working draft, directs wind or redirects

 7. WIND — the rivals
    purvapaksha → mingshi: ranked findings → FIRE fixes → WIND re-verifies.
    Max 2 rounds, then residuals go to the user.

 8. ★ GATE 4 — user approves the resolved draft

 9. VOID — the cut
    zhijian: kill-list pass — subtract habitual sentences and
    failure modes (untested code, missing version pins, unsupported
    claims); anything structural returns to fire, one re-cut.
    sutra: compresses what survives, casts the clean FCC-format
    publish file, headline package (3 scored titles) + decision card.

10. ★ PUBLISH — user reviews the publish file, picks the title, ships.
```

Every report ends **`Next ring: <name | none>`** — a one-line handoff recommendation.
The user always dispatches.

## Two-file output convention

- **Working file** (internal, Fire/Wind stage): keeps Feynman scaffolding — topic quality
  verdict, headline package scores, check-yourself section — per the user's `-feynman`
  drafts. Never published.
- **Publish file** (Void's deliverable): clean freeCodeCamp-Medium format — H1 title,
  subtitle line, cold-open scenario with code in the first screen, H2 sections, code
  explained after the block, decision card, one-line italic closing CTA. No internal
  metadata. Modeled on the user's `-MEDIUM` article.

## docs/house-style.md (the optional extra)

Copied into a writing project alongside the agents, like shinobi's `docs/agents/` extras
("copy only if you use it"). Scrolls load it before acting; disciples inherit the rules
from their scroll's dispatch brief. Contents:

1. **Audience & level** — write to a smart beginner; define jargon on first use; grade-6
   reading level target.
2. **Prose rules** — ≤25-word sentences (15–20 average), 2–3 sentence paragraphs, active
   voice, contractions, "So/But" over "Therefore/However", Oxford comma, US punctuation,
   max one exclamation per article, spell out 0–9 / numerals 10+.
3. **Anti-gatekeeping word list** — never "obviously", "simply", "just", "clearly",
   "as everyone knows", "basic", "easy"; no absolutist claims without evidence.
4. **Uncertainty markers** — `{"context": ...}`, `{"warning": ...}`, `{"confidence": X,
   "basis": ...}` JSON markers for unverified or context-bound claims.
5. **Code standards** — always a language identifier, tested code only, meaningful names,
   explain after the block, chunks ≤ ~30 lines, no images of code.
6. **Metrics** — units always, before/after always, business impact where it exists.
7. **Author voice (copied verbatim from the user's VOICE-BASIC)** — investigative openers
   ("When our metric started drifting, I wanted to understand why..."), transparent
   methodology lines, honest-failure lines ("My first attempt made things worse — here's
   why"). The authority-bio lines (years, scale) live here as author context, not agent
   persona.
8. **Format library** — the skeletons wenxin chooses from; every recipe = FCC base +
   technique's section structure:
   - `pure-fcc` — Hook → Why this happens → Safe patterns → Decision card → Conclusion
   - `fcc-feynman` — Simple explanation → Where it breaks → Rebuild → Quick reference →
     Check yourself (the user's `-feynman` article)
   - `fcc-socratic` — each section = the question a senior dev actually asks →
     evidence answer → next question falls out of the answer
   - `fcc-inversion` — "Here's how this fails" → each failure mode → the defense
   - `fcc-nyaya` — Thesis → Reason → Example → Application → Conclusion

## Voice distribution (user's voice copied verbatim, enforcement redistributed)

| Voice element | Enforced by |
|---|---|
| Investigative openers, transparent methodology | fire (drafts in this voice) |
| Anti-gatekeeping list, honest-failure lines, uncertainty markers | wind |
| Evidence-path phrasing (Production / Research / Analysis) | earth |
| Grade-6 level, sentence/paragraph limits | void |

## Agent file anatomy (identical to shinobi's five-part shape)

```markdown
---
name: <name>
description: <when to dispatch — one line>. <themed epithet line>.
model: inherit            # scrolls; disciples use sonnet
tools: <tier-appropriate list>   # scrolls include Agent
---

# <Name> — <Epithet> (<kanji>)

## Identity
- <2–3 in-character bullets>

## Mission
<one paragraph — what to do, boundaries, when to hand off>

## Squad (max 2 — never spawn any other agent type)
**Delegation is your default working mode for volume and breadth** — <mandate
paragraph>. Down: … Stays with you: …
- `<disciple>` — <one-line division of labor>
- `<disciple>` — <one-line division of labor>

## Report format
1. **<Stage artifact>** — <what it contains>
2. **<Stage artifact>** — <what it contains>
3. **Next ring:** <name | none> — one-line reason
```

Disciple files omit `## Squad` and use the three-tier tools; report format is
artifact + `Next ring:`.

## docs/rings-roster.md (mirrors shinobi-roster.md section-for-section)

1. Header — command structure summary (Musashi dispatches, 5 scrolls, max-2 squads,
   `Next ring:` convention, depth cap).
2. **The lifecycle flow** — mermaid flowchart: earth → water → fire → wind → void →
   publish, with gates as labeled dispatcher decision points.
3. **How a mission runs** — the numbered 10-step flow above.
4. **Per-ring sections** — *Work / In the flow / Handoffs* for each of the 5 scrolls.
5. **The 10 disciples table** — the table above.
6. **Dispatch guide** — "Your situation → Dispatch" table: "I have an idea / I have no
   idea what's happening → earth"; "topic chosen → water"; "outline approved → fire";
   "draft done → wind"; "findings fixed → void"; plus direct-disciple focused strikes
   ("just the naive explanation → manana", "just a saturation check → pramana").
7. **Efficiency rules** — don't skip earth; dispatch a disciple directly for focused
   strikes; one mission, one scroll; water's gap work never routes to earth; read-only
   disciples are cheap.

## Install (mirrors shinobi)

```sh
cp agents/scrolls/*.md agents/disciples/*.md /path/to/writing-project/.claude/agents/
cp docs/house-style.md /path/to/writing-project/.claude/   # optional extra
```

Merge `settings.json` (depth cap 2), restart, dispatch:
*"dispatch earth — I want to write about EF Core ExecuteUpdate pitfalls for a senior
.NET audience."*

## Error handling & boundaries

- **Unverifiable gaps** (paywalled, undocumented, preview-version behavior): manana
  flags them to the user at Gate 2 — never guesses, never fabricates.
- **Critique loop ceiling**: wind re-verification max 2 rounds, then residuals go to
  the user (`ponytail:`-style deliberate ceiling — infinite polish is where articles die).
- **Zhijian re-cut ceiling**: one re-cut after zhijian's kill-list pass.
- **Blocked disciple**: returns `Next ring: none — blocked, need author` instead of
  guessing (no silent fabrication).
- **pattern-memory (light)**: earth's mission text instructs it to check a
  `pattern-memory.md` in the writing project if present (recent titles, what performed)
  and skip already-published topics. The file is the user's, not the repo's — the repo
  ships no tracking system.

## Verification

The repo ships prompts only (shinobi-parity — no scripts). Verification is manual:
1. **Smoke mission** — run one small real topic end-to-end through the 5 scrolls; each
   report format holds; publish file is clean FCC format with no internal metadata.
2. **Reference integrity** — grep that every `Next ring:` target and every squad name in
   the 15 files resolves to an existing agent (fails loudly on a typo'd handoff).

## Explicit non-goals (v1)

- Viral/distribution machinery (comment velocity, VIRAL-PREDICTION, controversy templates,
  comment-driving endings) — add as an optional module later if wanted.
- Plugin skill wiring ("jutsu") — the techniques ARE the jutsu; the plugin ecosystem has
  no prose skills.
- Any runtime files, trackers, or scripts in the repo.
- Content Pipeline systems other than Content Engine's writing standards (AI Weekly,
  Prompt Engineering).

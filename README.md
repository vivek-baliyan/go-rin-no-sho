# ⚔️ Go Rin No Sho

Claude Code subagents themed on Miyamoto Musashi's 五輪書 (The Book of Five Rings) for
writing technical articles. You are **Musashi** — 5 scroll masters cover the article
lifecycle (discover → master → draft → critique → cut), each commanding a squad of 2
technique-disciples: one Chinese, one Indian. Every report ends with a **Next ring:**
recommendation; you always do the dispatching.

Standard mission: earth → water → fire → wind → void → publish, with four author gates
between. Full lifecycle diagram and per-agent reference:
[docs/rings-roster.md](docs/rings-roster.md).

## The roster

| Scroll | Ring | Role | Squad (max 2) |
|---|---|---|---|
| `earth` | 地 | topic discovery & saturation | gewu (terrain sweeps) · pramana (evidence grading) |
| `water` | 水 | mastery & form | manana (Vedantic mastery cycle) · wenxin (format & outline) |
| `fire` | 火 | the full write | wuwei (flow draft) · nidarshana (story layer) |
| `wind` | 風 | critique & revision | purvapaksha (steel-man) · mingshi (name-vs-reality) |
| `void` | 空 | the cut | zhijian (kill list) · sutra (compression & publish file) |

## Install

1. Copy the agents into your writing project (or `~/.claude/agents/` for user-wide).
   The `scrolls/` + `disciples/` split is repo organization only — Claude Code reads
   them flat from `.claude/agents/`:

```sh
cp agents/scrolls/*.md agents/disciples/*.md /path/to/writing-project/.claude/agents/
```

2. Merge `settings.json` into your project's `.claude/settings.json` — it caps subagent
   spawn depth at 2, so scrolls can summon their squad but disciples can never spawn
   further:

```json
{
  "env": {
    "CLAUDE_CODE_MAX_SUBAGENT_SPAWN_DEPTH": "2"
  }
}
```

3. Copy the style law (optional but strong — every scroll loads it when present):

```sh
cp docs/house-style.md /path/to/writing-project/.claude/house-style.md
```

4. Copy the mechanical checker (Void runs it as the countable half of its final read):

```sh
cp -r scripts /path/to/writing-project/.claude/scripts
```

5. Optional — the two vendored skills (`skills/paper-lookup`, `skills/citation-management`,
   MIT, from [K-Dense-AI/scientific-agent-skills](https://github.com/K-Dense-AI/scientific-agent-skills))
   upgrade gewu's and pramana's sourcing when present; both agents degrade gracefully
   without them:

```sh
cp -r skills/* /path/to/writing-project/.claude/skills/
```

6. Restart Claude Code, then dispatch from the agents menu. Try: *"dispatch earth —
   I want to write about EF Core ExecuteUpdate pitfalls for a senior .NET audience."*

## How it works

- **Scrolls** (`model: inherit`) may spawn **max 2** named disciples — the pair is
  listed in each scroll's `## Squad` section, with dispatch order encoded.
- **Disciples** (`model: sonnet`) have no `Agent` tool and can never spawn subagents
  (platform-enforced via tools + depth cap). Every disciple is also directly
  dispatchable for a single focused strike.
- **Every claim travels with a tier.** The working file's claim ledger
  (`claim | source | tier | stage graded`, house-style §10) — pramana grades first;
  manana, wenxin, and mingshi carry the tier forward instead of re-grading blind.
- **Earth labels its epistemics.** Every angle is tagged idea | assumption |
  prediction | located evidence | decision — a trend spike is an idea, never a
  saturation verdict.
- **Wind splits its residuals.** Author-facing content decisions vs pipeline-internal
  process notes — the author never receives squad gossip dressed as feedback.
- **Mastery runs on the Vedantic cycle** (shravana → manana → nididhyasana) under the
  Feynman standard: if it can't be explained to a child, it isn't mastered yet.
- **Format is chosen, not defaulted**: pure FCC, or FCC × a technique flavor
  (`fcc-feynman`, `fcc-socratic`, `fcc-inversion`, `fcc-nyaya`) — the library lives in
  the house-style doc and wenxin recommends from it at Gate 2.
- **Two files per article**: the internal working file (Feynman scaffolding, never
  published) and the clean FCC-format publish file (zero internal metadata).

## What it deliberately isn't

No viral machinery, no comment-velocity protocols, no trackers. Exactly one script —
the mechanical half of Void's final read — everything else is prompts. Inspired by the
format of [shinobi-agents](../shinobi-agents).

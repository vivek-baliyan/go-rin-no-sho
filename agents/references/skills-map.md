# Skills map

Read this before your first step. Every skill here is OPTIONAL: use it when it is installed,
fall back to WebSearch/WebFetch when it isn't, and never block on it. End your report with
`Skills used: … · skipped: … (why)`.

Subagents have no `AskUserQuestion` and sit at the spawn-depth cap (Musashi → scroll →
disciple), so a skill that asks the author something or spawns its own agent can't run here.
Return the question to Musashi instead.

| Role | OPTIONAL (with the caveat to apply) |
|---|---|
| gewu | `paper-lookup` (vendored: scholarly APIs via `curl` + bundled scripts), `paper-search` (`paper-search search "<q>" -n 5 -s openalex,crossref,arxiv`; name sources explicitly, the `fast` presets fail on some CLI versions; needs the `paper-search` CLI, `uv tool install paper-search-mcp`) |
| manana | `paper-search` (primary sources for gap-filling; `read` a paper rather than trusting its abstract) |
| mingshi | `citation-management` (vendored: validate a cited source's metadata), `paper-search` (find the original behind a second-hand number) |
| pramana | `citation-management` (dedupe and validate metadata before tiering) |

`citation-management` scripts need Python `requests` (`pip install requests`); `paper-lookup`
is stdlib-only.
| scrolls, other disciples | none |

## Not for agents (main session only)

- `last30days`: Musashi runs it before dispatching `earth` blank and pastes the result into
  the brief as "trend seeds" (see earth's Mission).
- `mattpocock-skills:research`: spawns a background agent and writes a file, so it fails the
  depth cap. Disciples do the reading themselves.
- `writing-for-agents`: use it when editing these agent files.
- `graphify`, `i-have-adhd`: off-domain or user-only.

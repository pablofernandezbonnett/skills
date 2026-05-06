# learning-material-author

Canonical repo copy of the local skill used for technical learning materials,
study notes, learning paths, refresh docs, and architecture or reliability
explanations that should stay clear, practical, and easy to reopen later.

Purpose:

- explain technical ideas in plain language without dumbing them down
- avoid jargon without purpose or explanation
- keep learning materials concise, scannable, and reusable
- favor practical mental models, small examples, visible tradeoffs, and clear weak-vs-strong reasoning

Use this skill when creating or revising material with a clear teaching shape, especially when the doc should follow a pattern such as `why this matters -> smallest mental model -> weak vs better -> small example -> strong default -> tradeoff`.

Use this skill when creating or revising:

- topic notes
- learning paths
- refresh docs
- architecture explainers
- study guides
- practical cheatsheets
- repo documentation meant for learning, onboarding, or knowledge reuse

Main files:

- `SKILL.md`
- `agents/openai.yaml`
- `references/style-rules.md`

This folder is the source of truth. Install or refresh it into
`~/.codex/skills` from the repo root with:

```bash
./install.sh learning-material-author
```

Example invocation:

```text
Use $learning-material-author to rewrite this architecture note into a clearer learning doc with less jargon, a stronger mental model, and better tradeoff explanations.
```

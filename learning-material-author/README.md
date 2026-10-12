# learning-material-author

Canonical repo copy of the local skill used for technical learning materials,
study notes, learning paths, refresh docs, and architecture or reliability
explanations that should stay clear, practical, and easy to reopen later.

Purpose:

- explain technical ideas in plain language without dumbing them down
- avoid jargon without purpose or explanation
- keep learning materials concise, scannable, and reusable
- favor practical mental models, small code or word examples, and visible
  tradeoffs when they help the reader use the idea

Use this skill when creating or revising material with a clear teaching goal.
Choose an explanation shape that fits the topic and reader; use a contrast
between weak and stronger reasoning when it clarifies a decision.

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

This folder is the source of truth. See the [repository's installation
instructions](../README.md#install-with-codex) to install it with
`$skill-installer`.

Example invocation:

```text
Use $learning-material-author to rewrite this architecture note into a clearer learning doc with less jargon, a stronger mental model, and better tradeoff explanations.
```

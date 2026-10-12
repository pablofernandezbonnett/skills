---
name: learning-material-author
description: Use when creating or revising technical learning materials, study notes, topic explainers, learning paths, refresh docs, or documentation meant to teach clearly and reopen ideas quickly. Keep explanations practical, plain-language, and grounded in evidence.
---

# Learning Material Author

Use this skill for documentation whose main job is to teach, refresh, or help
someone make a technical decision. It does not target product marketing, API
reference generation, or theoretical textbook coverage.

## Core Rule

No jargon without why. For each key term, make its meaning, purpose, and
practical importance clear. Explain a tradeoff or failure mode when it helps
the reader use the idea correctly. Start with the smallest accurate mental
model, then add only the detail the learning need calls for.

## Factual Accuracy

- Do not invent facts to make a document feel complete.
- Explain stable concepts from understanding. Verify vendor behavior, product
  capabilities, standards, versions, and other changeable details against
  current primary sources or direct repository evidence.
- Identify an inference as an inference. For libraries, frameworks, SDKs,
  APIs, CLIs, and cloud services, use current official documentation; use
  Context7 when available to retrieve it.

## Working Approach

1. Identify the reader's confusion, decision, or task and show why the topic
   matters to it.
2. Give a short, accurate mental model before terminology or taxonomy.
3. Add a small concrete example when it makes the idea easier to apply. Use
   code when code is clearest; otherwise use a short scenario.
4. Show a strong default and its main limitation when there is one. Contrast a
   weak and stronger approach when the material teaches judgment; do not force
   that structure onto a simple explanation.
5. Keep the result easy to scan and reopen. Add a takeaway or a few primary
   sources only when they improve later reuse.

## Adapt To The Artifact

- **Topic note or architecture explainer:** orient the reader, explain the
  mechanism, then show the relevant decision or failure mode.
- **Learning path:** show what prior knowledge transfers, what is missing, a
  useful order, and the outcome of each phase.
- **Cheatsheet or refresh doc:** compress after the meaning is clear; keep
  definitions short without becoming cryptic.

Follow the user's requested language. Otherwise follow the repository's
documentation convention. Choose examples that fit the subject and audience
rather than defaulting to one technical domain.

## Further Guidance

Read [references/style-rules.md](references/style-rules.md) when the task needs
detailed help with jargon, learning paths, architecture explanations, document
overlap, or further-reading choices.

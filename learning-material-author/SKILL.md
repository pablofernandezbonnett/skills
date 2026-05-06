---
name: learning-material-author
description: Use when creating or revising technical learning materials, study notes, topic explainers, learning paths, refresh docs, or documentation meant to teach clearly and reopen ideas quickly. This skill keeps the writing practical, plain-language, low-jargon, and reusable by explaining what a concept is, what problem it solves, why it matters, and what tradeoff or failure mode comes with it.
---

# Learning Material Author

## Overview

Use this skill when writing or revising technical documentation whose job is to
teach, refresh, or make a concept easier to reopen later.

Default goal:

- explain the concept in plain language
- keep the smallest useful mental model visible
- show why the idea exists and why it matters
- expose weak reasoning versus stronger reasoning when the topic is about decisions
- avoid buzzword-only explanations
- keep the material practical, scannable, and technically defensible

This skill is for learning-oriented documentation, not for product marketing,
API reference generation, or theoretical textbook writing.

## Core Rule

No jargon without why.

If a term appears, explain quickly:

- what it is
- what problem it solves
- why the reader should care
- what tradeoff, limitation, or failure mode comes with it when relevant

If the term's name is doing most of the explanatory work, the explanation is not
finished yet.

## Writing Priorities

Optimize for:

- clear study order
- fast reopening of rusty topics
- practical understanding
- reusable explanations
- low navigation friction
- precise but simple wording

Do not optimize for:

- encyclopedic coverage
- theory completeness
- buzzword density
- fancy target-state prose
- consultant-style wording

## Default Workflow

1. Start from the real learning need.
   Ask what confusion, decision, or mental gap the material should fix.

2. Explain why this matters before going broader.
   Make the practical value visible early so the reader knows what problem the
   topic helps with.

3. Define the smallest useful mental model first.
   Say the idea in the fewest accurate lines before adding layers.

4. Contrast weak reasoning with stronger reasoning when the topic is about
   judgment.
   Prefer `bad mental model vs better mental model` or `weak approach vs better
   approach` when the reader needs help rejecting bad decisions.

5. Add one small concrete example.
   Prefer a minimal backend, architecture, reliability, or data-flow example
   over abstract theory.

6. State the best approach or strong default when there is one.
   Say what a sensible first choice looks like before diving into edge cases.

7. Add the main tradeoff, failure mode, or caution.
   Learning materials are stronger when they show where the idea breaks down or
   what cost it introduces.

8. End with a reusable takeaway when useful.
   The reader should leave with one short answer they could explain out loud.

## Shape By Document Type

### Topic Note

Good shape:

1. why this matters
2. smallest useful mental model
3. bad mental model vs better mental model
4. small concrete example
5. best approach or strong default
6. main tradeoff or failure mode
7. short reusable takeaway

### Learning Path

Good shape:

1. role or skill transition
2. what already transfers from the current background
3. what still needs to be added
4. recommended order by phases
5. outcome per phase

### Architecture Or Design Explainer

Good shape:

1. why this matters
2. smallest useful mental model
3. bad mental model vs better mental model
4. small concrete example
5. best approach or strong default
6. main tradeoff, failure mode, or migration implication
7. practical rule

### Cheatsheet Or Refresh Doc

Good shape:

- reopen the concept quickly
- keep terms short but not cryptic
- compress only after the meaning is clear
- prefer one-line definitions plus one caution

## Style Rules

- Use English for durable repository documentation unless repo rules say
  otherwise.
- Prefer direct, concrete wording.
- Use short sections and flat lists.
- Explain the idea in one to three lines before deepening it.
- Use examples that are small enough to scan but real enough to defend.
- Prefer practical domain examples such as checkout, payments, merchants,
  inventory, queues, retries, or data flows when they fit.

## Good Patterns

Use these patterns often when they clarify the concept:

- bad mental model vs better mental model
- weak approach vs better approach
- bad example vs stronger example
- plain-English version
- why this matters
- best approach

These patterns help because they expose the decision boundary instead of only
defining the term. For architecture, reliability, and solution-design material,
these are often the default shape rather than optional decoration.

## Anti-Patterns

Avoid:

- jargon introduced without purpose
- vague slogans such as `scalable`, `secure`, `modern`, or `robust` without concrete meaning
- theory-first openings when the practical need is clearer
- long checklist sections with no mental model
- false simplicity that breaks under light technical follow-up
- mini-textbook drift when the job is refresh or study material

## Decision Tests

Before finalizing, check:

- can the reader tell why this concept exists?
- does each key term earn its place?
- is the smallest useful meaning visible early?
- is there at least one concrete example where helpful?
- is the best approach or strong default visible when one exists?
- is the main tradeoff, failure mode, or limitation visible?
- would the material help reject a bad mental model or weak decision, not only describe a term?

## References

Read `references/style-rules.md` when you need the fuller rules for:

- jargon control
- learning-material structure
- path-writing guidance
- tradeoff explanation
- duplicate control
- documentation review heuristics

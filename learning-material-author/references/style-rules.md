# Style Rules

## Base Principle

- The material should help the reader understand and reuse the idea, not only recognize the term.
- Clarity is more important than sounding advanced.
- Practical correctness is more important than theoretical completeness for refresh and study notes.

## No Jargon Without Why

- Do not introduce a term and move on as if the label explained itself.
- If a term appears, explain:
  - what it is
  - what problem it solves
  - why it matters here
  - what tradeoff or limitation comes with it when relevant

Short rule:

- if the reader can only repeat the term but not explain why it exists, the doc is still weak

## Smallest Useful Mental Model

- Give the smallest accurate version first.
- Do not begin with taxonomy when one plain-language explanation would open the topic faster.
- The first few lines should make the reader feel oriented, not tested.

Good pattern:

1. why this matters
2. smallest useful meaning
3. minimal example
4. tradeoff, failure mode, or caution

## Plain Language, Not Empty Language

- Prefer simple wording, but do not simplify until the claim becomes false.
- Avoid generic quality words without anchors:
  - `scalable`
  - `secure`
  - `robust`
  - `modern`
  - `maintainable`
  - `enterprise-grade`

Replace them with concrete meaning:

- what kind of load
- what kind of risk
- what kind of failure
- what kind of operational burden

## Practical Framing

- Open from the reader's real need when possible.
- Explain what confusion, design choice, or failure pattern the topic helps with.
- Use domain examples that feel close to real backend or architecture work.

Good example domains:

- checkout
- payments
- inventory
- merchants
- queues
- retries
- schema changes
- tenant isolation

## Useful Contrast Patterns

These usually improve learning docs:

- bad mental model vs better mental model
- weak approach vs better approach
- bad example vs stronger example
- symptom vs cause
- target state vs migration reality

Use them when they clarify a decision boundary.
Do not add them mechanically when a simpler explanation is already enough.

## Learning Paths

When writing a path, make the role shift visible:

- what the current background already gives the reader
- what new layer they need to add
- what order creates the strongest foundation
- what outcome each phase should produce

Good paths feel like:

- practical sequence
- visible transfer of prior strengths
- explicit gaps

Not like:

- a large unordered topic dump

## Topic Notes

Topic notes should usually help the reader do one of these:

- reopen a rusty concept
- explain a decision better
- avoid a common failure mode
- compare two nearby choices

If a topic note tries to do all of them equally, it often becomes too broad.

## Architecture And Reliability Material

- Name the invariant or critical rule early.
- Make the source of truth visible where relevant.
- Explain what fails under retries, partial failure, or migration.
- Show the operating or migration consequence, not only the target-state design.

## Refresh And Cheatsheet Bias

- Cheatsheets and refresh docs should be short, but not cryptic.
- Compress only after the meaning is already clear.
- A good one-line summary should still survive a basic follow-up question.

## Duplicate Control

- Fewer docs is usually better when two docs compete for the same job.
- If two docs overlap heavily, decide:
  - which one is canonical
  - which one is companion or background
  - whether one should be removed

Avoid making the reader wonder which doc to trust first.

## Review Questions

Before finishing, ask:

- does the opening explain why this topic matters?
- is the first useful meaning visible early?
- is any jargon unexplained or underexplained?
- does the reader get a concrete example where it helps?
- is the main tradeoff or failure mode visible?
- is the text concise without becoming telegraphic?
- would the material help a real person make or explain a better decision?

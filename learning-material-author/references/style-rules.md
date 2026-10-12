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

One useful pattern when the topic teaches a decision:

1. why this matters
2. smallest useful mental model
3. bad mental model vs better mental model
4. small concrete example, using code when it clarifies the idea best and a word example when it does not
5. best approach or strong default
6. main tradeoff, failure mode, or caution
7. optional reusable explanation shape when it helps the reader restate the idea clearly later

## Factual Accuracy And Source Discipline

- Do not invent product behavior, API details, vendor capabilities, standard requirements, or market facts.
- When the topic includes details that can change over time, verify them before writing as fact.
- Prefer primary or otherwise high-trust sources such as official docs, standards bodies, vendor documentation, or direct repository evidence.
- If a point is an inference rather than a confirmed fact, say so.

Short rule:

- explain stable concepts from understanding; verify unstable specifics before teaching them

- When official documentation exists, use it as the default source instead of secondary summaries.
- For libraries, frameworks, SDKs, APIs, CLIs, cloud platforms, or vendor-specific behavior, prefer current official docs.
- If `context7` is available in the working environment, prefer it to retrieve up-to-date official documentation before writing those materials.

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
- Prefer a small code example when code makes the concept easier to defend. If
  code would add noise, use a short word example or mini-scenario instead.

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

These can improve learning docs when they clarify a choice:

- bad mental model vs better mental model
- weak approach vs better approach
- bad example vs stronger example
- symptom vs cause
- target state vs migration reality

Do not add them mechanically when a simpler explanation is enough.

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

- Name why the topic matters before taxonomy or pattern names.
- Make the smallest mental model visible early.
- Use a weak-versus-strong contrast when it clarifies the judgment being taught.
- Name the invariant or critical rule early.
- Make the source of truth visible where relevant.
- Explain what fails under retries, partial failure, or migration.
- Show the operating or migration consequence, not only the target-state design.
- Prefer a strong default before edge-case branching when the reader needs decision help.
- A short reusable explanation can help, but only when it supports learning and compression instead of turning the note into interview prep.

## Refresh And Cheatsheet Bias

- Cheatsheets and refresh docs should be short, but not cryptic.
- Compress only after the meaning is already clear.
- A good one-line summary should still survive a basic follow-up question.

## Further Reading

- Add a short `Further Reading` section when it genuinely helps the reader go deeper or verify vendor-specific details later.
- Prefer official docs, standards, or other high-trust primary sources first.
- Keep the list short and intentional, usually `3-6` links.
- Each link should have a reason to exist, not just topic adjacency.
- Do not add a reading list if the links would mostly repeat what the note already says.

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
- does the reader get a concrete example where it helps, with code when useful and a word example when code would be noise?
- is the best approach or strong default visible when it should be?
- is the main tradeoff or failure mode visible?
- are factual details grounded in a trustworthy source instead of assumption or invention?
- is the text concise without becoming telegraphic?
- would the material help a real person reject a weak mental model and explain a better decision?
- if the note includes a short reusable explanation, is it there to support learning rather than to optimize for performance in an interview?

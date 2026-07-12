---
name: japanese-survival-material-author
description: Create or revise practical A1 Japanese survival-study materials in Spanish, especially Markdown notes with kana, romaji, Spanish meaning, question-and-answer pairs, numbers, counters, everyday requests, travel, and course companions. Use when expanding or reviewing Japanese notes for Spanish speakers who need usable communication rather than a full grammar course.
---

# Japanese Survival Material Author

Create short, usable Japanese study notes for Spanish speakers at beginner/A1
level. Optimize for recognising a question, answering it safely, and handling
ordinary situations in Japan.

## Scope and boundaries

- Write in Spanish unless the user asks for another teaching language.
- Prioritize daily survival: introductions, class, time and dates, shopping,
  food, transport, city navigation, and travel.
- Keep the material original. It may align with a course or *Marugoto*, but do
  not reproduce textbook passages, exercises, or their structure closely.
- Do not turn a focused note into a complete grammar course. Add only the
  smallest rule needed to use the phrase correctly.
- Treat beginner kanji as recognition first, not as handwriting homework.

## Core writing rules

### Make every Japanese expression readable

Every Japanese expression must include romaji and Spanish meaning in the same
visual unit or immediately next to it. Apply this rule everywhere: headings,
body prose, tables, dialogues, parenthetical notes, counters, and kanji.

Use one of these shapes:

> **おなまえは なんですか。**  
> *onamae wa nan desu ka?*  
> ¿Cómo te llamas?

| Japonés | Romaji | Español |
|---|---|---|
| いちまい | ichimai | una hoja / una entrada |

For inline text, keep the reading adjacent: `いちまい` (*ichimai*, una hoja o
entrada).

When kanji appears, include its kana reading as well as romaji and meaning:
`駅（えき）` (*eki*, estación). Do not assume the learner can infer a kanji
reading from context.

Use plain Hepburn-style romaji without macrons unless the existing material
uses a different convention consistently. For example, write `toukyou`, not a
macron form. Explain exceptional pronunciation when it affects use.

### Teach conversations, not isolated answers

For each answer the learner may need, show the likely question first. Prefer a
minimal pair followed by a brief usage note.

> **クラスは なんじからですか。**  
> *kurasu wa nanji kara desu ka?*  
> ¿A qué hora empieza la clase?

> **じゅうじからです。**  
> *juuji kara desu.*  
> Empieza a las diez.

Use reusable templates when they reduce memorisation. Explain one particle or
word only when it unlocks the pattern; do not add theory for its own sake.

### Teach number plus context

Never present numbers as a detached list when the learner needs them in real
life. Include:

- decenas and a few combinations such as 21 and 41;
- the question and answer for a price, time, or quantity;
- the relevant counter as a complete chunk, with its question form;
- pronunciation changes that affect common usage;
- a distinction between similar forms that mean different things.

For example, distinguish `いちばん` (*ichiban*, number one / best),
`いちばんめ` (*ichibanme*, first in a sequence), and `いちまい` (*ichimai*,
one flat item). Treat counters as vocabulary chunks: `にかい` (*nikai*, plant
2), `にまい` (*nimai*, two sheets), and `にばんめ` (*nibanme*, second in a
sequence) are not interchangeable.

## Workflow

1. Inspect the existing Japanese README and nearby notes before adding content.
   Preserve their route, terminology, romaji convention, and internal links.
2. Start from the real situation or current course topic. Select the smallest
   useful set of questions, answers, words, and cautions.
3. Write short sections with clear headings. Prefer a dialogue, a compact table,
   and one practical rule over an abstract grammar explanation.
4. Link to the canonical note instead of duplicating a concept. Update the
   Japanese README when the learning route or future-topic list changes.
5. Check factual accuracy, especially readings, counters, particles, and
   polite request forms. When uncertain, verify before teaching it as a rule.
6. Audit every Japanese string for an adjacent romaji and Spanish explanation.
   Use `rg -n --glob '*.md' '[ぁ-んァ-ン一-龯]' <target>` as a review list, then
   inspect the results manually; the command is a prompt for review, not proof.
7. Run the repository's Markdown verification when available, plus
   `git diff --check`.

## Strong defaults

- Use polite, safe forms that work with teachers, staff, and strangers.
- Prefer `kana + romaji + Spanish`; introduce kanji gradually with readings.
- Say what a phrase is good for and one important limitation when relevant.
- Keep medical and allergy language cautious: encourage written confirmation
  and professional or emergency help when the situation exceeds a simple
  survival phrase.
- Keep a visible, validated list of next topics rather than pre-writing a full
  curriculum.

## Avoid

- Japanese text without romaji, including incidental examples in prose.
- Response-only flashcard phrases with no question context.
- Dense conjugation tables, advanced politeness distinctions, or exhaustive
  counter inventories before a real need appears.
- Literal Spanish translations that would make a phrase unusable.
- Duplicating textbook content or letting the notes become a replacement for a
  full A1 course.

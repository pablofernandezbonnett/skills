# cv-positioning-copy

Canonical repo copy of the local skill used for CVs, LinkedIn profiles, cover
letters, and candidate-summary wording.

Purpose:

- keep all employability artifacts aligned with verified candidate evidence
- preserve `credibility > optimization`
- improve punch without overselling
- keep wording natural and interview-defendable

Use this skill when refining:

- a master CV
- an offer-specific CV
- a LinkedIn profile
- a cover letter
- a candidate summary or positioning paragraph

Start from a real source-of-truth profile or verified work history in the
project being edited. If they conflict, resolve the discrepancy before using
the disputed claim.

Main files:

- `SKILL.md`
- `agents/openai.yaml`
- `references/style-rules.md`

This folder is the source of truth. Install or refresh it into
`~/.codex/skills` from the repo root with:

```bash
./install.sh cv-positioning-copy
```

The normal installer writes only to the user skills directory. The optional
`--system` flag also copies this skill into `.system` for existing setups that
use that location.

Example invocation:

```text
Use $cv-positioning-copy to tighten this LinkedIn About section without overstating experience or responsibility.
```

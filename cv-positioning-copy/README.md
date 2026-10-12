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

This folder is the source of truth. See the [repository's local-use
instructions](../README.md#local-use). For an existing setup that uses the
compatibility copy installer, run this from the repository root:

```bash
./install.sh cv-positioning-copy
```

The optional `--system` flag also copies this skill into `.system` for existing
setups that use that location; see the [installer details](../README.md#compatibility-copy-installer).

Example invocation:

```text
Use $cv-positioning-copy to tighten this LinkedIn About section without overstating experience or responsibility.
```

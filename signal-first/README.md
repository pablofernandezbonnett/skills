# signal-first

Canonical repo copy of the local communication skill used to keep responses
concise, direct, professional, and high-signal without dropping technical
precision.

Purpose:

- reduce fluff
- lead with the answer
- keep explanations compact but accurate
- preserve a senior-engineer communication style

Use this skill when you want Codex responses to be:

- concise
- direct
- professional
- technically precise
- high-signal for the current request, or for the rest of the thread when
  explicitly requested

Main files:

- `SKILL.md`
- `agents/openai.yaml`

This folder is the source of truth. See the [repository's local-use
instructions](../README.md#local-use). For an existing setup that uses the
compatibility copy installer, run this from the repository root:

```bash
./install.sh signal-first
```

The optional `--system` flag also copies this skill into `.system` for existing
setups that use that location; see the [installer details](../README.md#compatibility-copy-installer).

Example invocation:

```text
Use $signal-first for the rest of this thread.
```

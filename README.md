# Personal Codex Skills

This repository is the source of truth for local Codex skills that should
survive device changes, reinstalls, and cleanup in `~/.codex/skills`.

Each skill is a small, focused folder for the Codex desktop and CLI skill
system. The real contract lives in `SKILL.md`; references, metadata, scripts,
and assets exist only when they add clear value.

## What This Repository Is For

The point is not to collect dozens of vague prompts.

The point is to keep a small set of reusable skills that improve repeatable
engineering and writing workflows:

- clearer technical communication
- stronger documentation and learning material
- safer AppSec-oriented code review
- better positioning work for CV and career documents

## Current Skills

- `signal-first`: concise, direct, professional engineering communication
- `cv-positioning-copy`: CV, LinkedIn, cover-letter, and profile wording that
  stays credible
- `learning-material-author`: plain-English learning and technical
  documentation writing
- `appsec-review`: evidence-first AppSec review for backend, web, and mobile
  code

## Repository Structure

Each skill should keep its durable files close to the actual workflow:

- `SKILL.md`: trigger metadata and working instructions
- `agents/openai.yaml`: optional UI metadata
- `references/`: longer guidance that should be loaded only when needed
- `scripts/` or `assets/`: only when deterministic helpers or reusable output
  files are genuinely useful

Some skills also keep a short local `README.md` when a human-readable summary
or maintenance note is worth having in the repo.

## Install And Sync

By default, `install.sh` copies skills into:

- `$CODEX_HOME/skills` when `CODEX_HOME` is set
- `~/.codex/skills` otherwise

`signal-first` and `cv-positioning-copy` are also synced into
`~/.codex/skills/.system` because they are meant to be globally discoverable in
future Codex sessions.

Install or refresh every skill:

```bash
./install.sh
```

Install or refresh one skill:

```bash
./install.sh signal-first
./install.sh cv-positioning-copy
./install.sh learning-material-author
./install.sh appsec-review
```

## Example Use

```text
Use $signal-first to keep this review concise and high-signal.
Use $learning-material-author to rewrite this note into clearer study material with less jargon.
Use $appsec-review to review this backend and mobile flow for OWASP-aligned risks grounded in repository evidence.
```

## Repository Rule

Edit skills here first.

Treat `~/.codex/skills` as the installed copy, not the canonical copy.

## Public Repository Status

This repository is public, but read-only by default.

If you want to adapt or extend a skill, fork the repo and use it as the base
for your own local setup.

If you want to contribute directly here, ask for access first.

Commercial use is not allowed under the default license split.

## Related Documents

- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [LICENSE](./LICENSE)

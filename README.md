# Personal Codex Skills

This folder is the source of truth for local Codex skills that should survive
device changes, reinstalls, and cleanup in `~/.codex/skills`.

These skills are meant for the Codex desktop/CLI skill system, where each skill
is a folder with a `SKILL.md` file and optional metadata, references, scripts,
or assets.

## Status

This repository is public, but read-only by default.

If you want to adapt or extend a skill, fork the repo and use it as a base for
your own local setup.

If you want to contribute directly to this repository, ask for access first.

Commercial use is not allowed under the default license split.

Current skills:

- `signal-first`
- `cv-positioning-copy`

## Structure

Each skill folder should contain the files Codex actually uses:

- `SKILL.md`
- `agents/openai.yaml` when UI metadata is needed
- `references/` for longer rules or guidance
- `scripts/` or `assets/` only when truly needed

Each skill may also include a short local `README.md` explaining:

- what the skill is for
- what its source-of-truth role is
- any installation or maintenance notes

## Install / Sync

By default, the install script copies skills into:

- `$CODEX_HOME/skills` when `CODEX_HOME` is set
- `~/.codex/skills` otherwise

To install or refresh all skills into that target location:

```bash
./install.sh
```

To install only one skill:

```bash
./install.sh signal-first
./install.sh cv-positioning-copy
```

## Use

Once installed, the skills can be invoked from Codex by name, for example:

```text
Use $signal-first to keep this review concise and high-signal.
Use $cv-positioning-copy to refine this CV from the candidate profile.
```

## Rule

Edit skills here first.

Treat `~/.codex/skills` as the installed copy, not the canonical copy.

## Related Documents

- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [LICENSE](./LICENSE)

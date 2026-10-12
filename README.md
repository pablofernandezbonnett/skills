# Codex Skills

This repository is the source of truth for these skills. Keep it under version
control and connect its skill folders to Codex on each device.

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
- `japanese-survival-material-author`: Spanish-first A1 Japanese survival
  material with kana, romaji, and question-and-answer practice
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

## Local Use

OpenAI documents `$HOME/.agents/skills` as the user-level skill location and
supports symlinked skill folders. For a fresh setup, run the following from
the repository root to work directly from this checkout without copying after
every edit. If you previously used the copy installer, reconcile those copies
first so the same skills do not appear in multiple locations.

```bash
mkdir -p "$HOME/.agents/skills"
for manifest in */SKILL.md; do
  skill="${manifest%%/*}"
  ln -s "$PWD/$skill" "$HOME/.agents/skills/$skill"
done
```

The `ln` command refuses to replace a name that already exists. Inspect that
entry before replacing it. Keep each skill installed in one discovery location
to avoid duplicate names in Codex. Codex normally detects skill changes; if a
skill does not appear, restart the app.

See [OpenAI's skill guide](https://learn.chatgpt.com/docs/build-skills) for
current discovery locations and invocation behavior.

## Compatibility Copy Installer

`install.sh` supports existing setups that copy skills into:

- `$CODEX_HOME/skills` when `CODEX_HOME` is set
- `~/.codex/skills` otherwise

Prerequisites:

- `zsh`
- `rsync`

The installer copies repo folders that contain a `SKILL.md`. It does not build,
fetch, or register anything remotely. It overwrites destination files with the
same names and keeps other files already in an installed skill folder. Check
your local edits before refreshing a skill.

With its default settings, this script does not install into
`$HOME/.agents/skills`. Its normal run writes only to the copy destination
above. `--system` also copies `signal-first` and `cv-positioning-copy` into
`.system` for setups that already use that location; it can cause those skills
to appear twice.

Install or refresh every skill:

```bash
./install.sh
```

Install or refresh one skill:

```bash
./install.sh signal-first
./install.sh cv-positioning-copy
./install.sh learning-material-author
./install.sh japanese-survival-material-author
./install.sh appsec-review
```

Preview destinations without writing files:

```bash
./install.sh --dry-run
./install.sh --dry-run --system signal-first
```

List installable skills:

```bash
./install.sh --list
```

Show installer usage:

```bash
./install.sh --help
```

## Example Use

```text
Use $signal-first to keep this review concise and high-signal.
Use $learning-material-author to rewrite this note into clearer study material with less jargon.
Use $japanese-survival-material-author to create Japanese survival-study notes for Spanish speakers.
Use $appsec-review to review this backend and mobile flow for OWASP-aligned risks grounded in repository evidence.
```

## Validation

Run `python3 scripts/validate_skills.py` to check required frontmatter fields
and local Markdown links, then exercise the installer in a temporary Codex home.
The same check runs in GitHub Actions on pushes and pull requests.

## Repository Rule

Edit skills here first.

Treat copied skills under `~/.codex/skills` as installed copies, not the
canonical source. Symlinks into this checkout stay current with the repo.

## Public Distribution

These folders can be inspected or installed individually. For a reusable
bundle of several skills, [OpenAI recommends a plugin](https://developers.openai.com/plugins/build/plugins).
This repository does not yet include a plugin manifest or marketplace entry.

## Public Repository Status

This repository is public, but read-only by default.

If you want to adapt or extend a skill, fork the repo and use it as the base
for your own local setup.

If you want to contribute directly here, ask for access first.

The repository uses non-commercial terms. Under the current [LICENSE](./LICENSE),
`SKILL.md`, scripts, metadata, and embedded code examples fall under PolyForm
Noncommercial 1.0.0; prose documentation, references, and non-code assets fall
under CC BY-NC-SA 4.0. Check the license text for the terms that apply to your
planned use. Commercial use requires separate permission.

## Related Documents

- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [LICENSE](./LICENSE)

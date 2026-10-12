# Codex Skills

This repository is the source of truth for these skills. Install individual
skills from GitHub with Codex's built-in `$skill-installer`.

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

## Install with Codex

Ask Codex to use its built-in installer. You can install one skill or all five;
no checkout or repository script is required. For example:

```text
Use $skill-installer to install appsec-review from https://github.com/pablofernandezbonnett/skills/tree/main/appsec-review.
```

To install the complete set:

```text
Use $skill-installer to install these folders from pablofernandezbonnett/skills on main: appsec-review, cv-positioning-copy, japanese-survival-material-author, learning-material-author, and signal-first.
```

The installer places each skill under `$CODEX_HOME/skills` (normally
`~/.codex/skills`). It refuses to replace an existing skill folder, so review
any existing installation or local edits before replacing it. Installed copies
do not update automatically. To update one, review the new version, move the
old installed folder aside, and install again. Also check for an existing copy
or symlink under `$HOME/.agents/skills`: the installer does not check that
location, and duplicate skill names can appear in Codex. Review a skill's
`SKILL.md` and any scripts before installing it, as you would with other
third-party code.

Codex normally detects newly installed skills. If one does not appear,
restart the app. See [OpenAI's skill guide](https://learn.chatgpt.com/docs/build-skills)
and the bundled `$skill-installer` for current behavior.

## Develop from a local checkout

OpenAI also documents `$HOME/.agents/skills` as a user-level skill location and
supports symlinked skill folders. If you are editing these skills, clone the
repository and run this from its root so Codex reads your working files:

```bash
mkdir -p "$HOME/.agents/skills"
for manifest in */SKILL.md; do
  skill="${manifest%%/*}"
  ln -s "$PWD/$skill" "$HOME/.agents/skills/$skill"
done
```

The `ln` command refuses to replace a name that already exists. Inspect that
entry first, and keep each skill in one discovery location to avoid duplicate
names in Codex. This checkout workflow is for authors who want edits to take
effect without reinstalling; the GitHub installer is simpler for users.

## Example Use

```text
Use $signal-first to keep this review concise and high-signal.
Use $learning-material-author to rewrite this note into clearer study material with less jargon.
Use $japanese-survival-material-author to create Japanese survival-study notes for Spanish speakers.
Use $appsec-review to review this backend and mobile flow for OWASP-aligned risks grounded in repository evidence.
```

## Validation

Run `python3 scripts/validate_skills.py` to check required frontmatter fields
and local Markdown links. The same check runs in GitHub Actions on pushes and
pull requests.

## Repository Rule

Edit skills here first.

Treat installed skills under `~/.codex/skills` as copies, not the canonical
source. Symlinks into this checkout stay current with the repo.

## Public Distribution

These folders can be inspected and installed individually with
`$skill-installer`. This repository currently distributes standalone skills,
without a plugin manifest or marketplace entry.

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

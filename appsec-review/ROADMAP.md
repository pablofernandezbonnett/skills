# AppSec Review Roadmap

This roadmap describes how the `appsec-review` skill should evolve without
turning into a vague security catch-all.

## Current Direction

The first version is intentionally narrow:

- code and configuration review first
- evidence-backed findings only
- lightweight scanner support
- clear coverage for backend, web frontend, and mobile frontend code

That keeps the skill useful for real engineering work without drowning reviews
in generic controls or low-signal warnings.

## Phase 1

Goal: establish a reliable default review workflow.

Deliverables:

- OWASP-aligned review workflow in `SKILL.md`
- focused reference files for backend, frontend/mobile, and scanner usage
- documentation written in plain English for repeatable use
- package-manager bias set to `pnpm` for JS/TS repositories unless the repo
  says otherwise

## Phase 2

Goal: improve consistency without over-automating.

Possible additions:

- repeatable command patterns for common repo types
- tighter guidance for multi-tenant authz review
- stronger coverage for file uploads, signed URLs, and background-job attack
  surfaces
- better mobile review prompts for Flutter and native clients
- optional report templates for security review output

## Phase 3

Goal: add automation only where the signal is strong.

Possible additions:

- small helper scripts for lockfile discovery or report normalization
- repo-aware dependency review shortcuts
- targeted support for SBOM-based review where projects already produce SBOMs
- optional GitHub PR review workflows for AppSec triage

## Guardrails

- Do not expand into infrastructure, cloud posture, or generic DevSecOps unless
  a separate skill is warranted.
- Do not add scanners just to look more complete.
- Do not optimize for checklist length over review quality.
- Do not treat dependency vulnerability output as equal to an exploitable
  application flaw.

## Success Criteria

The skill is working if it helps an engineer answer:

1. what the likely application risk is
2. what code or config proves it
3. how to fix it with the stack already in use

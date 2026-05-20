---
name: appsec-review
description: Use when the user wants an AppSec-focused review of backend, web frontend, or mobile client code to detect plausible vulnerabilities grounded in repository evidence, especially OWASP-aligned risks such as broken authn/authz, secret exposure, injection, insecure storage, unsafe external calls, weak session handling, or dependency vulnerabilities.
---

# AppSec Review

## Goal

Use this skill for evidence-first application security review.

The job is to find plausible security weaknesses in the repository as it exists,
not to recite generic best practices or pretend a full pentest happened.

## Review Stance

- Prefer repository evidence over generic OWASP wording.
- Be cautious with certainty. If evidence is incomplete, report a verification
  gap or a plausible risk, not a false fact.
- Map findings to OWASP only when that helps explain impact.
- Treat backend, web frontend, and mobile frontend as separate trust-boundary
  surfaces.

## Workflow

1. Read the root `AGENTS.md` and the most specific child `AGENTS.md` for the
   files in scope.
2. Identify the real stack, manifests, lockfiles, and existing security
   libraries before suggesting fixes.
3. Use Context7 for framework-specific security APIs when behavior is unclear.
4. Review the code along trust boundaries:
   - authentication and authorization
   - request validation and output encoding
   - secrets, crypto, and configuration
   - external calls, uploads, files, and path handling
   - logging, error handling, and observability leakage
   - session, token, browser, or mobile storage boundaries
5. Run focused scanners when the files or change justify it:
   - `gitleaks git --staged --redact --no-banner` for staged or diff-focused
     secret exposure checks
   - `trufflehog filesystem --no-verification --fail .` when working-tree files,
     fixtures, dumps, or generated artifacts may contain credentials
   - `osv-scanner scan source -r .` or targeted lockfile scans when dependency
     vulnerability review is in scope and supported manifests exist
6. Report findings with evidence, impact, and a concrete fix path.

## Stack Rules

- For JavaScript or TypeScript repositories, prefer `pnpm` workflows and
  `pnpm-lock.yaml`. Do not default to `npm` unless the repository already uses
  it explicitly.
- Verify the manifest before suggesting any new security dependency or scanner.
- Reuse the project's existing logger, validation layer, and security framework
  where possible.

## Review Areas

- Backend review: use [references/backend-checks.md](references/backend-checks.md)
- Web and mobile frontend review: use
  [references/frontend-and-mobile-checks.md](references/frontend-and-mobile-checks.md)
- Secrets and dependency review: use
  [references/secrets-and-dependencies.md](references/secrets-and-dependencies.md)
- Full review flow and reporting shape: use
  [references/review-workflow.md](references/review-workflow.md)

## Output Contract

Present findings first.

Each finding should include:

- severity
- confidence
- evidence
- file reference
- exploit or failure path
- concrete remediation

Then include:

- open questions or verification gaps
- important residual risk
- suggested follow-up checks only when they materially reduce uncertainty

## Do Not Overclaim

- Do not label something exploitable if the repo evidence only shows a weak
  signal.
- Do not guess environment variable names, route contracts, claim formats, or
  storage behavior when the source of truth can be inspected.
- Do not turn dependency vulnerability output into a flood of low-signal noise.
  Prioritize reachable, relevant, or clearly high-impact issues.

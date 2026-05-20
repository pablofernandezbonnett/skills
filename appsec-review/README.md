# appsec-review

Canonical repo copy of the local skill used for AppSec-focused reviews of
backend services, web frontends, and mobile clients.

This skill exists to answer a practical question:

Where are the likely security weaknesses in this codebase, based on what the
repository actually shows?

It keeps the review grounded in evidence instead of generic OWASP recitals.

## What The Skill Tries To Do

- find plausible vulnerabilities in real code and configuration
- explain why the issue matters in application terms
- keep backend, web, and mobile trust boundaries distinct
- prefer concrete fixes over vague security advice
- stay useful for engineers who need to ship and review code, not just label risks

## What It Covers

- broken authentication and authorization
- IDOR or BOLA-style access control mistakes
- input validation failures and common injection paths
- secret exposure in code, config, logs, fixtures, or generated artifacts
- insecure token, session, browser, or mobile storage handling
- unsafe external calls such as SSRF-prone HTTP clients
- file upload, path traversal, and deserialization risks
- dependency vulnerability review when lockfiles or manifests support it

The review uses OWASP as a mental model, not as a copy-paste checklist.

For mobile-oriented frontend work, the skill also keeps OWASP Mobile and MASVS
style concerns in view, especially around local storage, deep links, WebViews,
device trust assumptions, and API boundary misuse.

## What It Does Not Pretend To Do

- full penetration testing
- infrastructure hardening outside the repository
- compliance certification work
- magical exploit confirmation when the repo evidence is incomplete

If a claim cannot be supported from the code or configuration, the skill should
report a gap or hypothesis, not fake certainty.

## Built-In Tooling Bias

This v1 is intentionally simple.

It combines guided review with tools that are already useful and easy to trust:

- `gitleaks` for staged or diff-focused secret exposure checks
- `trufflehog` for working-tree and artifact-heavy secret checks
- `osv-scanner` for dependency vulnerability review when the repository has
  supported lockfiles or manifests

For JavaScript and TypeScript repositories, the default package-manager bias is
`pnpm`, not `npm`, unless the repository explicitly says otherwise.

## Main Files

- `SKILL.md`
- `agents/openai.yaml`
- `references/review-workflow.md`
- `references/backend-checks.md`
- `references/frontend-and-mobile-checks.md`
- `references/secrets-and-dependencies.md`

## Install

Install or refresh this skill from the repository root:

```bash
./install.sh appsec-review
```

## Example Invocation

```text
Use $appsec-review to review this backend and mobile API flow for broken authz, secret exposure, insecure storage, and OWASP-aligned risks grounded in repository evidence.
```

# Review Workflow

Use this file when the review needs a more explicit sequence than the short
workflow in `SKILL.md`.

## 1. Establish Scope

Work from the files that define the trust boundary:

- manifests and lockfiles
- runtime config
- auth middleware and token handling
- route/controller or handler entry points
- validators, DTOs, and serializers
- HTTP clients and outbound integrations
- file, storage, or document flows
- browser or mobile persistence and session code

## 2. Build The Smallest Accurate Threat Picture

Ask:

- who can call this path
- what identity or tenant context is trusted
- what input crosses the boundary
- what leaves the system
- where a secret, token, or file is stored or forwarded

Do not jump to exploit language before those answers are visible.

## 3. Review By Failure Shape

Good review shape:

- broken authn or authz
- unsafe trust in client-controlled data
- injection or parser abuse
- secret handling failures
- unsafe external reachability
- sensitive data leakage
- dependency or supply-chain exposure that actually affects the repo

## 4. Use Scanners Deliberately

Only run scanners that match the review question.

- use `gitleaks` for staged or diff-focused secret checks
- use `trufflehog` when working-tree files, fixtures, or generated artifacts may
  contain credentials
- use `osv-scanner` when the repository has supported manifests or lockfiles and
  dependency risk matters

Do not use scanner output as a substitute for judgment.

## 5. Report Clearly

Each finding should answer:

- what is wrong
- why it matters
- what evidence supports it
- how an attacker or misuse path would reach it
- what fix fits the current stack

Prefer file references and concrete control failures over broad labels.

## 6. Distinguish Three Outcomes

- confirmed finding: evidence is strong
- plausible risk: evidence is partial but meaningful
- verification gap: a key fact is missing and must be checked before claiming a
  vulnerability

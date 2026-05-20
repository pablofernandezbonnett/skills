# Secrets And Dependencies

This file keeps scanner usage focused and low-noise.

## Secret Exposure Checks

Use `gitleaks` when the risk is primarily in tracked or staged changes:

```bash
gitleaks git --staged --redact --no-banner
```

Use `trufflehog` when the concern includes working-tree files, generated
artifacts, fixtures, exports, or dumps:

```bash
trufflehog filesystem --no-verification --fail .
```

Treat findings as blocking unless the value is clearly fake test data and the
reason to ignore it is explicit.

## Dependency Vulnerability Checks

Use `osv-scanner` when the repository has supported manifests or lockfiles and
dependency review is worth doing.

Good defaults:

```bash
osv-scanner scan source -r .
```

For targeted lockfile review:

```bash
osv-scanner scan source --lockfile=pnpm-lock.yaml
```

When the repository is large, prefer targeted scope over recursive scans that
mix unrelated projects.

## How To Read Dependency Results

Do not flatten all results into one bucket.

Prioritize:

- clearly high-severity issues
- reachable runtime dependencies
- packages tied to exposed entry points
- vulnerabilities affecting the deployed stack rather than dev-only tooling

Lower priority:

- dev-only packages with no runtime impact
- low-confidence matches without a visible affected path
- large result sets with no clear exploit relevance

## Package Manager Bias

For JavaScript or TypeScript repositories, prefer `pnpm` and `pnpm-lock.yaml`
as the source of truth unless the repository explicitly uses a different package
manager.

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

Verify scanner matches before reporting them. Treat a confirmed live secret
as urgent, and explain whether it needs removal, rotation, or both. A match in
test data may be dismissed when its purpose and lack of real access are clear.

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

## Package Manager Selection

For JavaScript or TypeScript repositories, use the package manager and lockfile
the project actually uses. If neither is clear, inspect configuration before
choosing a scanner target or suggesting package commands.

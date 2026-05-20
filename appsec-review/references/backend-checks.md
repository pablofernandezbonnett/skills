# Backend Checks

Use these prompts to review backend code without drifting into a generic
security checklist.

## Authentication And Session Boundaries

Check:

- token parsing and claim validation
- session expiry, revocation, and audience checks
- fallback or debug auth paths
- confused-deputy behavior between services
- whether unauthenticated and authenticated routes are clearly separated

Weak signal:

- auth exists but route-level enforcement is inconsistent

Stronger signal:

- a handler trusts identity or role data that can be client-controlled or
  bypassed

## Authorization And Tenant Isolation

Check:

- object lookup by raw ID without ownership or tenant checks
- administrative actions guarded only in the UI
- missing policy checks on update, export, or document endpoints
- cache keys or background jobs that drop tenant scope

Common OWASP mapping:

- Broken Access Control
- API1/BOLA and API3/BOPLA style failures

## Input Validation And Injection

Check:

- SQL, JPQL, HQL, Mongo, shell, template, or regex injection paths
- unsanitized dynamic query building
- unsafe deserialization or permissive polymorphic parsing
- validation that happens too late, after side effects already started

Do not assume a framework validator is enough if dangerous values are later
concatenated into queries, paths, or commands.

## External Calls And SSRF

Check:

- outbound HTTP clients that accept user-controlled URLs
- webhook fetchers, import flows, image/document fetchers
- cloud metadata reachability
- redirect following behavior
- internal network exposure through proxy helpers

## Files, Paths, And Documents

Check:

- file upload type and size enforcement
- path construction from user input
- archive extraction behavior
- document preview or conversion pipelines
- signed URL scope and expiry

## Logging And Error Leakage

Check:

- credentials or tokens in logs
- stack traces or internal details returned to clients
- inconsistent error mapping that reveals record existence or authorization state

## Rate Limits And Abuse Controls

Check:

- authentication endpoints
- expensive search or export endpoints
- password reset, invite, verification, or token issue flows

Absence is not always a finding. Treat it as one when the endpoint is clearly
abusable and no compensating control is visible.

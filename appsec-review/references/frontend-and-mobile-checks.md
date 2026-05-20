# Frontend And Mobile Checks

Use this file when the review scope includes browser clients, Flutter apps, or
mobile-oriented frontend code.

## Web Frontend Trust Boundaries

Check:

- where tokens, session identifiers, or PII are stored
- whether dangerous HTML rendering paths exist
- whether untrusted data reaches DOM sinks without safe encoding
- whether client-side role checks are mistaken for real authorization
- whether API base URLs, secrets, or environment values are exposed in bundles

Common OWASP mapping:

- XSS
- Broken Access Control when the UI implies protection that the backend does not
  enforce
- Security Misconfiguration for CSP, CORS, or mixed-origin assumptions

## Browser Session And Origin Handling

Check:

- cookie assumptions versus token storage
- CSRF exposure when cookies authenticate cross-site requests
- CORS rules that are broader than the real caller set
- postMessage or iframe communication without origin checks
- redirect and callback handling in auth flows

## Mobile-Focused Checks

For mobile or Flutter clients, keep OWASP Mobile and MASVS-style concerns in
view.

Check:

- secrets or API keys embedded in the app bundle
- insecure local storage for tokens, refresh tokens, or sensitive user data
- trust in client-side flags for role, entitlement, or environment
- deep-link handlers that can be abused to reach unsafe flows
- WebView bridges that expose privileged actions to untrusted content
- permissive certificate or host validation in networking code
- debug logging that leaks credentials, payloads, or device identifiers

## Better And Worse Reasoning

Weak mental model:

- the frontend validates it, so the backend is safe
- the mobile app is compiled, so secrets are hidden

Better mental model:

- the client is a hostile boundary for trust and storage decisions
- local validation improves UX but does not enforce authorization or integrity
- mobile packaging changes access cost, not the need for server-side controls

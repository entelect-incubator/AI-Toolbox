# Security Check: OWASP Top 10

Use this guide as a quick security gate during design, implementation, review, and release.

Reference:
- https://owasp.org/Top10/

## How To Use

1. Run this checklist when spec is approved.
2. Re-check during pull request review.
3. Confirm high-risk items before release.

## A01: Broken Access Control

- Are authorization checks enforced on every protected action?
- Are object-level permissions validated server-side?
- Are admin paths isolated and tested for bypass attempts?

## A02: Cryptographic Failures

- Is sensitive data encrypted in transit and at rest where required?
- Are modern crypto libraries and approved algorithms used?
- Are secrets and keys managed outside source code?

## A03: Injection

- Are all external inputs validated and sanitized?
- Are queries and commands parameterized?
- Are template/render paths protected against injection vectors?

## A04: Insecure Design

- Did the team model abuse and misuse scenarios?
- Are rate limits, anti-automation, and fraud controls defined?
- Are security requirements present in the spec, not only code comments?

## A05: Security Misconfiguration

- Are secure defaults enabled across environments?
- Are debug endpoints and verbose errors disabled in production?
- Are CORS, headers, and platform settings reviewed?

## A06: Vulnerable And Outdated Components

- Are dependencies scanned for vulnerabilities?
- Are critical CVEs patched before release?
- Is dependency update policy defined and followed?

## A07: Identification And Authentication Failures

- Are authentication flows hardened (MFA, lockout, session controls where needed)?
- Are tokens/sessions invalidated correctly on logout and rotation events?
- Are password/reset flows protected against abuse?

## A08: Software And Data Integrity Failures

- Are build and deployment steps protected from tampering?
- Are package and artifact sources trusted and pinned where possible?
- Is untrusted serialized data avoided or verified?

## A09: Security Logging And Monitoring Failures

- Are security-relevant actions logged with usable context?
- Are alerts configured for suspicious activity?
- Can the team investigate incidents with available logs/metrics?

## A10: Server-Side Request Forgery (SSRF)

- Are outbound requests constrained by allowlists and network policy?
- Is user-controlled URL fetching restricted and validated?
- Are metadata/internal endpoints blocked from application-level fetches?

## Minimum Evidence For PR Approval

- Checklist reviewed for affected surfaces
- Tests added for high-risk security paths
- Known security risks documented with owner and mitigation date

## Practical Examples

Example: A01 broken access control check
- Endpoint: PATCH /users/{id}/role
- Test: non-admin receives forbidden response.
- Evidence: integration test plus policy check in code review.

Example: A03 injection check
- Endpoint accepts search query.
- Test: input with SQL metacharacters is parameterized and safe.
- Evidence: unit test plus query layer review.

Example: A10 SSRF check
- Feature fetches external URL preview.
- Control: allowlist approved domains only.
- Evidence: test blocks localhost and metadata endpoints.

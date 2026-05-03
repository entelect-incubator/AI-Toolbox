# Security Policy

## Reporting A Vulnerability

Do not open public issues for security vulnerabilities.

Report privately to your organization security channel or repository security contact.

Include:
- Affected component/path
- Reproduction steps
- Impact assessment
- Suggested mitigation (if known)

## Response Targets

- Acknowledge receipt: within 1 business day
- Initial triage: within 3 business days
- High severity mitigation plan: within 5 business days

## Security Review Standard

For all production-impacting changes:
- Run `.ai/guides/SECURITY-OWASP-TOP10.md`
- Document findings and owners in PR
- Block release on unresolved High severity issues unless risk accepted in writing

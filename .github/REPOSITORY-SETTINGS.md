# Repository Settings (Recommended)

Apply these settings to support spec-driven development quality controls.

## Branch Protection

- Protect `main`
- Require pull request before merge
- Require at least 1 approving review (2 for critical repos)
- Dismiss stale approvals when new commits are pushed
- Require conversation resolution before merge
- Require linear history (optional but recommended)

## Required Checks

- `quality-gates` workflow from `.github/workflows/quality-gates.yml`
- Lint/check workflow (if configured)
- Test workflow (if configured)
- Spec validation hook/check for `.ai/specs/features`

## Merge Strategy

- Prefer squash merge for cleaner history
- Require PR title format aligned to change intent

## Security And Access

- Enable secret scanning and push protection
- Enable Dependabot alerts and security updates
- Use least-privilege permissions for automation tokens

## Pull Request Hygiene

- Use `.github/pull_request_template.md`
- Require link to spec path(s)
- Require risk notes and test evidence
- Enforce review routing from `.github/CODEOWNERS` and `.github/REVIEW-ROUTING.md`
- Use `.github/ISSUE_TEMPLATE/` for standardized intake

# Quality Audit: Find Gaps Early

Use this audit at project start, before major releases, and after large refactors.

## Audit Scope

- Requirements quality
- Architecture and code quality
- Testing maturity
- Security and data handling
- Delivery workflow and traceability

## 1) Requirements And BA Audit

- Are user stories clear, valuable, and testable?
- Are acceptance criteria binary and measurable?
- Are edge cases and constraints documented?
- Is scope vs non-scope explicit?

## 2) Code And Design Audit

- Are modules cohesive with clear boundaries?
- Are SOLID and clean-code principles reasonably applied?
- Is error handling consistent and actionable?
- Are dependencies explicit and isolated?

## 3) Test And QA Audit

- Do tests cover happy, negative, and edge paths?
- Are critical paths automated?
- Are integration boundaries tested?
- Are regressions tracked and prevented?

## 4) Security And Compliance Audit

- Is sensitive data protected in code, logs, and prompts?
- Are secrets managed externally?
- Are auth and authorization checks complete?
- Are third-party usage and licenses reviewed?
- Is OWASP Top 10 checklist reviewed for impacted surfaces?
- Are high-risk findings documented with owner and due date?

## 5) Delivery Process Audit

- Is there traceability from story to tests?
- Are pull requests scoped and reviewable?
- Are CI gates enforcing quality?
- Are release and rollback steps documented?

## 6) OWASP Top 10 Quick Pass

- Run `.ai/guides/SECURITY-OWASP-TOP10.md`
- Mark impacted categories and resulting actions
- Block release on unresolved High severity issues unless risk accepted in writing

## Audit Output Template

- Gap
- Impact
- Priority (High/Medium/Low)
- Owner
- Due date
- Verification method

## Practical Examples

Example: audit finding entry
- Gap: API endpoint lacks authorization check on update action.
- Impact: Unauthorized data modification risk.
- Priority: High.
- Owner: Backend lead.
- Verification: Add integration tests for role-based access and re-run security review.

Example: release gate decision
- 2 medium findings open, no high findings.
- Team documents mitigation dates.
- Release approved with tracked follow-up tasks.

# QA Role Playbook

Mission:
- Validate that delivered behavior matches specs and quality bars.

Responsibilities:
- Build test cases from acceptance criteria and edge cases
- Verify negative paths, permissions, data validity, and observability
- Report mismatches between implementation and spec

Validation strategy:
- Map every acceptance criterion to at least one test
- Cover happy path, negative path, and edge path
- Verify resilience behavior for dependency failures
- Validate auditability with logs and trace signals where required

Release gate checklist:
- Critical workflows are automated
- Regression suite passes
- Known defects are triaged and risk-accepted where needed
- Test evidence is attached to release decision

Definition of done:
- All critical acceptance criteria are validated
- Regression and edge-case coverage exists
- Defects are logged with reproducible steps

Feedback loop to BA/Dev:
- Report spec mismatches and ambiguous criteria explicitly
- Prioritize defects by user impact and release risk
- Next read: `.ai/guides/CROSS-CRAFT-HANDOFFS.md`

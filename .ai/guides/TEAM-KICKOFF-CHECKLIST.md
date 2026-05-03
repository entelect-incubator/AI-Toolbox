# Team Kickoff Checklist (Sprint 0)

Use this single page to align BA, Dev, and QA before delivery starts.

## 1) Select Context (Owner: BA + Tech Lead)

- [ ] Choose one context: New project, Legacy project, Existing modern adding AI
- [ ] Run intake questions from `.ai/guides/START-HERE.md`
- [ ] Confirm business outcome, timeline, and constraints

Output:
- Problem statement
- Scope and non-scope
- Initial risk list

## 2) Story And Spec Baseline (Owner: BA)

- [ ] Draft top user stories with clear business value
- [ ] Write deterministic acceptance criteria
- [ ] Capture edge cases, dependencies, and assumptions
- [ ] Create feature specs from `.ai/specs/templates/feature.spec.md`

Output:
- Prioritized story list
- Approved feature specs for Sprint 1

## 3) Architecture And Standards Alignment (Owner: Tech Lead + Dev)

- [ ] Confirm module boundaries and integration points
- [ ] Review `.ai/memory/architecture.md` and `.ai/memory/standards.md`
- [ ] Define non-functional targets (security, performance, observability)
- [ ] Identify technical risks and mitigation plan

Output:
- Architecture notes and decisions
- Delivery constraints for implementation

## 4) AI Workflow And Safety Setup (Owner: Dev + QA)

- [ ] Align team on `.ai/guides/AI-INSTRUCTIONS.md`
- [ ] Align tool workflow in `.ai/guides/AI-WORKFLOWS.md`
- [ ] Review prototype safety in `.ai/guides/PROTOTYPING-SAFETY.md`
- [ ] Confirm no sensitive/IP data will be shared with hosted tools

Output:
- Team prompt contract
- Approved prototype safety rules

## 5) Dev Execution Readiness (Owner: Dev)

- [ ] Generate scaffolds from approved specs only
- [ ] Define branch strategy and PR sizing rules
- [ ] Add baseline test skeletons per acceptance criteria
- [ ] Confirm error handling and observability conventions

Output:
- First implementation plan
- Scaffolded feature modules

## 6) QA Execution Readiness (Owner: QA)

- [ ] Build test plan from acceptance criteria
- [ ] Include happy path, negative path, and edge path coverage
- [ ] Define test data strategy and environments
- [ ] Agree release gate evidence required per feature

Output:
- Risk-based test plan
- Release gate checklist

## 7) Quality Audit Gate (Owner: BA + Dev + QA)

- [ ] Run `.ai/guides/QUALITY-AUDIT.md`
- [ ] Record gaps with owner, priority, and due date
- [ ] Confirm CI/hook checks are active

Output:
- Audit action log
- Go/No-Go recommendation for Sprint 1 build

## Definition Of Kickoff Done

- [ ] Stories, specs, and acceptance criteria approved
- [ ] Architecture and standards aligned
- [ ] AI workflow and safety guardrails agreed
- [ ] Dev and QA plans ready with clear owners
- [ ] Audit completed and top gaps assigned

## Practical Examples

Example: Sprint 0 output package
- Approved spec paths: 3 features.
- Assigned owners: BA, backend dev, QA lead.
- Evidence: kickoff notes, risk log, initial test plan.

Example: not ready signal
- Acceptance criteria still ambiguous.
- No test data strategy defined.
- Action: extend kickoff by one session before implementation starts.

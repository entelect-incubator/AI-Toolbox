# Start Here: Intake Questions

Use this as the first conversation in discovery, refinement, and planning.

## Step 1: Choose Project Context

Pick one:
- New project
- Legacy project
- Existing modern project adding AI

## New Project: Starter Questions

- What business outcome are we targeting in 90 days?
- Who are the primary users and what are their top 3 jobs?
- What are the non-negotiable constraints (compliance, security, budget, timeline)?
- What does MVP include and explicitly exclude?
- What quality bar is required for launch (availability, performance, test coverage)?
- What data do we need, and where does it come from?
- What are the top technical risks and mitigations?
- What does done mean for BA, Dev, and QA?

## Legacy Project: Starter Questions

- What parts of the system are business critical?
- Where is the highest defect density today?
- Which areas have poor test coverage or no automated tests?
- What are current architectural bottlenecks and known debt hotspots?
- Which integrations are fragile or undocumented?
- What can be safely changed now vs later?
- What baseline metrics should we capture before changes?

## Existing Modern Project Adding AI: Starter Questions

- Which user workflows will AI improve first?
- What decision types can AI assist vs must remain deterministic?
- What data is allowed for prompts and what is strictly prohibited?
- How will we evaluate AI output quality and safety?
- What fallback behavior is required when AI fails or is uncertain?
- What observability is needed for prompts, latency, and output quality?
- What human review gates are required before production rollout?

## Output Of Intake

After answering these questions, produce:
- Problem statement
- Scope and non-scope
- Prioritized user stories
- Risks and assumptions
- Initial quality plan

## Practical Examples

Example: new project intake output
- Problem statement: Reduce cart abandonment by 15 percent in 90 days.
- Scope: guest checkout and payment retry UX.
- Non-scope: loyalty program redesign.
- Initial quality plan: checkout flow requires happy, negative, and timeout path tests.

Example: modern project adding AI
- Target workflow: support ticket triage suggestions.
- Human gate: agent must confirm before send.
- Fallback: deterministic rules route if model confidence is low.

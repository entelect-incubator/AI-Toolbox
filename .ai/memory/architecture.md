# Architecture Rules

## Module Shape
- One feature module per business capability under src/modules/<feature>
- Keep routing, service, data, and tests separated

## Dependencies
- Domain/service logic must not depend directly on UI adapters
- External integrations must be isolated behind explicit interfaces

## Traceability
- Every module must reference one or more specs from .ai/specs/features
- Every endpoint and data model must be traceable to a spec section

## Non-Functional Baseline
- Security by default
- Observable logs and metrics for critical flows
- Backward compatibility checks before breaking contracts

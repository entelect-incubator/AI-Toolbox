# Feature: customer-search

## Context
Support agents need to find customer records quickly by name, email, or mobile number when handling inbound requests.
Current lookup is manual and inconsistent, which increases average handle time and causes duplicate account creation.
This feature provides a single deterministic search endpoint and a predictable UI behavior contract.

## Inputs
- query: string (required, 2-80 chars)
- limit: integer (optional, default 20, min 1, max 50)
- cursor: string (optional, opaque pagination token)
- includeInactive: boolean (optional, default false)

## Outputs
- results: array of customer summaries
- nextCursor: string or null
- totalApprox: integer
- requestId: string (trace id)

Customer summary shape:
- customerId: string
- fullName: string
- primaryEmail: string or null
- primaryMobile: string or null
- status: ACTIVE | INACTIVE
- createdAt: ISO-8601 datetime

## Rules
- Query normalization:
  - Trim leading and trailing whitespace.
  - Collapse multiple internal spaces to one space.
  - Case-insensitive matching for names and emails.
  - Mobile matching ignores spaces, dashes, and leading plus sign.
- Validation:
  - query shorter than 2 chars returns 400 with code INVALID_QUERY.
  - query longer than 80 chars returns 400 with code INVALID_QUERY.
  - limit outside range 1-50 returns 400 with code INVALID_LIMIT.
- Ranking:
  - Exact email match ranks highest.
  - Exact mobile match ranks second.
  - Name prefix match ranks above name contains match.
  - ACTIVE customers rank above INACTIVE when score ties.
- Pagination:
  - Results sorted deterministically by rank desc, then createdAt desc, then customerId asc.
  - Cursor must encode the last seen sort tuple and be tamper-safe.
- Privacy:
  - If requester lacks PII_VIEW permission, mask email and mobile in results.

## API
- GET /api/customers/search

Query params:
- query: string
- limit: integer
- cursor: string
- includeInactive: boolean

Success response (200):
- {
    "results": [
      {
        "customerId": "cst_1042",
        "fullName": "Alicia Stone",
        "primaryEmail": "al***@example.com",
        "primaryMobile": "+27******321",
        "status": "ACTIVE",
        "createdAt": "2026-04-10T09:40:15Z"
      }
    ],
    "nextCursor": "eyJzIjoiLi4uIn0",
    "totalApprox": 138,
    "requestId": "req-9fc3f1"
  }

Error response (400):
- {
    "error": {
      "code": "INVALID_QUERY",
      "message": "query must be between 2 and 80 characters"
    },
    "requestId": "req-1ac90d"
  }

## Data Model
Entity: Customer
- customerId: string (pk)
- fullName: string
- normalizedName: string (indexed)
- primaryEmail: string (indexed)
- normalizedMobile: string (indexed)
- status: enum ACTIVE | INACTIVE
- createdAt: datetime
- updatedAt: datetime

Entity: CustomerSearchAudit
- auditId: string (pk)
- actorId: string
- queryHash: string
- resultCount: integer
- requestId: string
- createdAt: datetime

Indexes:
- idx_customer_normalized_name
- idx_customer_email
- idx_customer_mobile
- idx_customer_status_created

## Edge Cases
- Query has only punctuation after normalization -> 400 INVALID_QUERY.
- Query matches more than 10,000 records -> return first page normally, totalApprox capped at 10000.
- Cursor from different query or user scope -> 400 INVALID_CURSOR.
- Customer updated between page requests -> deterministic sort prevents duplicate items in subsequent pages.
- Downstream customer store timeout -> 503 SEARCH_UNAVAILABLE with retryable=true.

## Acceptance Criteria
- [ ] Given query="alicia@example.com", when requester has PII_VIEW, then exact email match is first result.
- [ ] Given query="+27 82-123-4321", when formatted variants exist, then normalized mobile exact match is first result.
- [ ] Given query length 1, when request is sent, then API returns 400 with code INVALID_QUERY.
- [ ] Given limit=100, when request is sent, then API returns 400 with code INVALID_LIMIT.
- [ ] Given requester without PII_VIEW, when results are returned, then email/mobile are masked.
- [ ] Given same query and same dataset, when paging with cursor, then result order is deterministic and no duplicates appear across pages.
- [ ] Given includeInactive=false, when inactive-only records match, then they are excluded.
- [ ] Given customer store timeout, when search executes, then API returns 503 SEARCH_UNAVAILABLE and logs requestId.

## Non-Functional
- Performance:
  - p95 latency <= 300 ms for queries returning up to 50 rows.
  - p99 latency <= 700 ms under 200 RPS steady load.
- Security:
  - OWASP A01: enforce permission checks for PII fields.
  - OWASP A03: parameterized queries only; no string-concatenated SQL.
  - OWASP A09: structured audit events include actorId and requestId.
- Observability:
  - Emit metrics: search_requests_total, search_latency_ms, search_errors_total.
  - Emit logs with requestId, actorId, queryHash (never raw query text), resultCount, and statusCode.
  - Add dashboard panel for p95 latency and 4xx/5xx rates.

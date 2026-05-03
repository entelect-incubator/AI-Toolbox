# Prototyping Safety Guide

Use this when prototyping with tools such as Replit, Loveable, and Base44.

## Rule Zero

Do not paste company-sensitive data, source code, credentials, customer data, or proprietary algorithms into public or third-party tools unless approved by policy.

## Safe Prompting Checklist

- Use synthetic or anonymized data only
- Remove secrets, tokens, and private URLs
- Replace real company names with placeholders if needed
- Share only minimal context required for the prototype
- Assume prompts may be retained by the provider

## Prototype Scope Rules

- Prototype behavior and flow, not production internals
- Keep integrations mocked unless approved
- Keep architecture simple and disposable
- Document assumptions and known gaps

## Promotion Rules (Prototype -> Real Build)

- Re-implement production code in your governed repository
- Re-validate against internal coding, security, and QA standards
- Add proper tests and observability
- Perform security and license checks before merge

## Red Flags

- Real customer records in prompts
- API keys in example snippets
- Copying full internal repositories into hosted prompt tools
- Shipping prototype code directly to production

## Practical Examples

Example: safe prototype prompt
- Build a support dashboard mock using synthetic ticket data.
- Use fake company names and fake API endpoints.
- Show only UI flow and validation states.

Example: unsafe prototype prompt
- Here is production schema and real customer export, build full admin tool.
- Includes real API key and internal URL.
- This should be blocked and rewritten safely.

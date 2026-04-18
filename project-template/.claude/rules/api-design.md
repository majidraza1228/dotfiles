# API Design Rules

## URL Conventions

- Resources are plural nouns: `/products`, `/feedback`
- Actions use verbs only when REST doesn't fit: `/api/feedback/export`
- No trailing slashes
- Versioning only if breaking changes are planned: `/api/v1/`

## HTTP Methods

| Action | Method | Example |
|--------|--------|---------|
| List | GET | `GET /api/products` |
| Detail | GET | `GET /api/products/:id` |
| Create | POST | `POST /api/feedback` |
| Update | PUT/PATCH | `PUT /api/feedback/:id` |
| Delete | DELETE | `DELETE /api/feedback/:id` |

## Response Format

Always return JSON with a consistent shape:

```json
{ "data": {...}, "error": null }
{ "data": null, "error": "Validation failed: rating is required" }
```

## Status Codes

- `200` — success (GET, PUT)
- `201` — created (POST)
- `400` — bad request (validation error)
- `404` — not found
- `500` — server error (log it, never expose internals)

## Validation

Validate at the route level before touching the DB. Return `400` with a clear message.

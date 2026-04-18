# Testing Rules

## Framework

- Use `pytest` for all Python tests
- Test files: `tests/test_<feature>.py`
- No mocking the database — use a real test SQLite DB seeded per test run

## What to Test

- Every API endpoint: happy path + at least one error case
- Any function with branching logic
- Do NOT test Flask internals or third-party libraries

## Running Tests

```bash
pytest tests/ -v
```

## Test Structure

```python
def test_submit_feedback_returns_201():
    # Arrange
    ...
    # Act
    response = client.post("/api/feedback", json={...})
    # Assert
    assert response.status_code == 201
```

## CI

Tests must pass before any PR is merged. No `# type: ignore` or `# noqa` without a comment explaining why.

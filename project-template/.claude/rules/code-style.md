# Code Style Rules

## Python

- snake_case for variables and functions
- PascalCase for classes
- Max line length: 100 characters
- No unused imports — remove them
- f-strings over `.format()` or `%`
- Early returns over deeply nested conditions

## Flask Routes

- Group routes by feature, not by HTTP method
- Route functions named after the action: `submit_feedback`, `list_products`
- Always return a tuple `(response, status_code)` from API routes

## SQL / SQLite

- Table names: plural, snake_case (`user_feedback`, `products`)
- Always use parameterised queries — never string interpolation
- Migrations go in `schema.sql` — never raw ALTER in app code

## File Naming

- Templates: `feature_action.html` (e.g. `product_detail.html`)
- Static: `feature.css` / `feature.js`
- No abbreviations in file names

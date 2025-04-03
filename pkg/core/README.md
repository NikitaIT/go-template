# Core Domain

That's where the business logic lives.

- It's not where uuid generation happens.
- It's not where the raw sql is used, unless it's primary query lang.

If there is no business logic, it's fine to have it only in app.

Keep domains list flat.

# Framework

> "Don't call us, we'll call you"
> When using a framework, the application-specific code written by the programmer gets called by the framework.
> [HollywoodPrinciple](https://wiki.c2.com/?HollywoodPrinciple)

If something calls you or "privides context / background", it is a framework.

- MQ/Jobs calls you
- HTTP/gRPC/GraphQL calls you
- ORM calls you (e.g. `db.Create(&user)` => `onCreate(handler)`)
- DI calls you and construct dependency graph in the background
- U call logger, but logger do some side effects for you in the background
- Metrics same as logger
- Config
- Middleware `Use` calls you
- File/Operation/Transport system calls you
- Decorators/Reflection calls you (e.g. `@Transactional` => reflect.intercept(struct))

Framework supports `Application Services` by providing abstruction on top of the process / control flow effects.

Framework provides [Cross-cutting concerns](https://en.wikipedia.org/wiki/Cross-cutting_concern). It's `Monitoring` not `Metrics`, `Logging` not `Logger`, `Tracing` not `Trace`, `Config` not `Configuration`, `Security` not `Auth`, `Error Handling` not `Error`, `Validation` not `Validator`, `Serialization` not `Serializer`, `Caching` not `Cache`, `Routing` not `Router`, `Persistence` not `db`, etc.

## CMD entry points

Solo purpose of this pkg is [Code mobility](https://en.wikipedia.org/wiki/Code_mobility).

It allows to run:

- application on demand as [stateless processes](https://12factor.net/processes).
- [admin/management tasks](https://12factor.net/admin-processes) as one-off processes. They are not part of the app's long-running services, but they are part of the app's codebase. They are run in the same environment as the app's long-running services, and they can access the same resources (e.g. databases, queues, etc.). Admin processes are typically used for tasks such as database migrations, data imports/exports, and other maintenance tasks.

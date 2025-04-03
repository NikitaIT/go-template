# Internal

Internal packages contain the domain, app, and gateway.

- Gateway is an entry point to the app. Entry point is a [composition root](https://blog.ploeh.dk/2011/07/28/CompositionRoot/) and [application controller](https://martinfowler.com/eaaCatalog/applicationController.html)
- App is connection between the `domain` and `transport`. App is **IO validation boundary**.
- Domain is the core of the app with models and logic. Domain is **always valid**.

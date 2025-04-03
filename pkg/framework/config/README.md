# Config

An app's config is everything that is likely to vary between deploys (staging, production, developer environments, etc.)[1](https://12factor.net/config).

Solo purpose of this pkg is to provide a way to load config from different sources (e.g. env vars, files, etc.) and to provide a way to access it **in a type-safe way**.

**It's not a place to put your config.** It's a place to provide a way to load config from app entrypoint.

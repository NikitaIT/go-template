# Go Fmt

Default Go formatter is not strict enough. It doesn't enforce a consistent style across the codebase. It is recommended to use `gofumpt` instead.

```sh
go install mvdan.cc/gofumpt@latest
gofumpt -l -w .
```

Integrate to IDE: [VSCode or Idea or vim](https://github.com/mvdan/gofumpt?tab=readme-ov-file#visual-studio-code)

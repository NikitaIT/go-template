# Go Install dev tools

General rule of good package: name is adjective or pattern. Good name reflects the value of the package.

```sh
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/air-verse/air@latest # live reload
brew install golangci-lint
brew upgrade golangci-lint
# for vscode-go
cp /opt/homebrew/bin/golangci-lint /opt/homebrew/bin/golangci-lint-v2 # https://github.com/golang/vscode-go/issues/3732
```

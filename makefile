PKGVER := $(shell git describe --tags)
LDFLAGS += -X "main.BuildTimestamp=$(shell date -u "+%Y-%m-%d %H:%M:%S")"
LDFLAGS += -X "main.pkgVersion=$(PKGVER)"
LDFLAGS += -X "main.goVersion=$(shell go version | sed -r 's/go version go(.*)\ .*/\1/')"

GO := GO111MODULE=on CGO_ENABLED=0 go

all: build
.PHONY: all

# the name of the binary when built
BINARY_NAME=psp

lint:
	staticcheck .
test:
	go test ./...
test-cover:
	go test -v -cover ./...


# add linting and pre-commit hook
.PHONY: init
init: install-golangci-lint
	go install golang.org/x/tools/cmd/goimports@latest
	@echo "Install pre-commit hook"
	@ln -s $(shell pwd)/.hooks/pre-commit $(shell pwd)/.git/hooks/pre-commit || true
	@chmod +x ./hack/check.sh

.PHONY: install-golangci-lint
install-golangci-lint:
ifeq (, $(shell which golangci-lintx))
	@$(shell curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(GOPATH)/bin $(GOLANGCI_LINT_VERSION))
endif


.PHONY: setup
setup: init
	git init

.PHONY: check
check:
	@./hack/check.sh ${scope}

.PHONY: ci
ci: init
	@$(GO) mod tidy && $(GO) mod vendor



.PHONY: install
install: check
	@echo "Installing mypkg..."
	@$(GO) install -ldflags '$(LDFLAGS)'

.PHONY: release
release: check
	GOOS=darwin GOARCH=amd64 $(GO) build -ldflags '$(LDFLAGS)' -o bin/darwin/mypkg
	GOOS=linux GOARCH=amd64 $(GO) build -ldflags '$(LDFLAGS)' -o bin/linux/mypkg
	GOOS=windows GOARCH=amd64 $(GO) build -ldflags '$(LDFLAGS)' -o bin/windows/mypkg.exe

# .PHONY: docker-image
# docker-image:
# 	docker build -t nikitait/mypkg:$(PKGVER) -f ./Dockerfile .

# .PHONY: push-docker-image
# push-docker-image:
# 	docker push nikitait/mypkg:$(PKGVER)

# remove any binaries that are built
clean:
	rm -f ./bin/$(BINARY_NAME)*

build-debug: clean
	CGO_ENABLED=0 go build -gcflags=all="-N -l" -o bin/$(BINARY_NAME)-debug ./cmd/psp/main.go
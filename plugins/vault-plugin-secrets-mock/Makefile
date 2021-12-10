.DEFAULT_GOAL := all

all: fmt build start

build:
	GOOS=$(shell go env GOOS) GOARCH="$(shell go env GOARCH)" go build -o vault/plugins/vault-plugin-secrets-mock cmd/vault-plugin-secrets-mock/main.go

start:
	vault server -dev -dev-root-token-id=root -dev-plugin-dir=./vault/plugins

enable:
	vault secrets enable -path=mock-secrets vault-plugin-secrets-mock

clean:
	rm -f ./vault/plugins/vault-plugin-secrets-mock

fmt:
	go fmt $$(go list ./...)

.PHONY: build clean fmt start enable

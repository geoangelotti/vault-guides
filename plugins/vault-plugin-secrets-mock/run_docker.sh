#!/usr/bin/env bash

docker run -d --name notary -p 8200:8200 -v $(pwd)/vault/plugins:/plugins \
	-e 'VAULT_ADDR=http://127.0.0.1:8200' -e 'VAULT_DEV_ROOT_TOKEN_ID=root' -e 'VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200' --cap-add=IPC_LOCK \
	$1 sh -c "vault server -dev -dev-root-token-id=root -dev-plugin-dir=/plugins"

sleep 20 && docker logs notary

docker exec notary /bin/sh -c "apk add file && file /plugins/* && file /bin/vault"

docker exec notary /bin/sh -c "vault secrets enable -path=mock-secrets vault-plugin-secrets-mock"

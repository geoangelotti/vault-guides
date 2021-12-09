#!/bin/env bash

export DOCKERID=$(docker container ls  | grep 'vault' | awk '{print $1}')
echo $DOCKERID
docker cp $DOCKERID:/bin/vault vault-bin
docker kill $DOCKERID

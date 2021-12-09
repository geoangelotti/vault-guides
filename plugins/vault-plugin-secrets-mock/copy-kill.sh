#!/bin/env bash

export DOCKERID=$(docker container ls  | grep 'vault' | awk '{print $1}')
echo $DOCKERID
docker cp $DOCKERID:/bin/vault vault-bin
ls -l
docker kill $DOCKERID

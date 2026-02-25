#!/bin/bash

set -e

IMAGE="liquibase"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

docker build -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  dgoss run $IMAGE
fi

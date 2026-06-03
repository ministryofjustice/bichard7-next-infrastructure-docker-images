#!/bin/bash

set -e

BUILD_IMAGE="amazon-linux2023-base:${DOCKER_TAG:-latest}"
IMAGE="postfix"

docker build -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  dgoss run $IMAGE
fi

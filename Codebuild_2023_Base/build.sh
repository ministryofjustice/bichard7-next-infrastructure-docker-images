#!/bin/bash

set -e

BUILD_IMAGE="amazon-linux2023-base:${DOCKER_TAG:-latest}"
IMAGE="codebuild-2023-base"

docker build --platform=linux/amd64 -t "${IMAGE}" .

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  dgoss run $IMAGE
fi

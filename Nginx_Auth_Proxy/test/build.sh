#!/bin/bash

set -e

BUILD_IMAGE="amazon-linux2023-base:${DOCKER_TAG:-latest}"
IMAGE="nginx-auth-test"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

echo "Building for $PLATFORM"

if [ "$PLATFORM" = "arm64" ]; then
  docker build --platform linux/arm64 --build-arg BUILD_IMAGE="${BUILD_IMAGE}" -t $IMAGE .
else
  docker build --platform linux/amd64 --build-arg BUILD_IMAGE="${BUILD_IMAGE}" -t $IMAGE .
fi

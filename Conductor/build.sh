#!/bin/bash

set -ex

IMAGE="conductor"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

echo "Building conductor for $PLATFORM"

if [ "$PLATFORM" = "arm64" ]; then
  docker build -f Dockerfile --platform linux/arm64 --build-arg CONDUCTOR_VERSION=$(cat conductor_version) -t $IMAGE .
else
  docker build -f Dockerfile --platform linux/amd64 --build-arg CONDUCTOR_VERSION=$(cat conductor_version) -t $IMAGE .
fi

#!/bin/bash

set -e

BUILD_IMAGE="amazon-linux2023-base:${DOCKER_TAG:-latest}"
IMAGE="nginx-auth-proxy"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

docker build --build-arg BUILD_IMAGE="${BUILD_IMAGE}" -t $IMAGE .

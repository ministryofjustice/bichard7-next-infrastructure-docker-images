#!/bin/bash

set -ex

BUILD_IMAGE="amazon-linux2023-base:${DOCKER_TAG:-latest}"
IMAGE="conductor"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

docker build --build-arg CONDUCTOR_VERSION=$(cat conductor_version) --build-arg BUILD_IMAGE="${BUILD_IMAGE}" -t $IMAGE .

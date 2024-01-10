#!/bin/bash

set -ex

IMAGE="conductor"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

echo "Building conductor for $PLATFORM"

if [ "$PLATFORM" = "arm64" ]; then
  docker build -f conductor.Dockerfile --platform linux/arm64 --build-arg CONDUCTOR_VERSION=$(cat conductor_version) --build-arg CONFD_CHECKSUM=abd4b6a96b8af12a01e6c3063defec2655d5b817a74d43fb706c9ca8f814dd2e --build-arg CONFD_PLATFORM=arm64 -t $IMAGE .
else
  docker build -f conductor.Dockerfile --platform linux/amd64 --build-arg CONDUCTOR_VERSION=$(cat conductor_version) -t $IMAGE .
fi

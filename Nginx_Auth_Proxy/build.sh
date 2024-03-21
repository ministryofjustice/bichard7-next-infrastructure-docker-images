#!/bin/bash

set -e

IMAGE="nginx-auth-proxy"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

echo "Building for $PLATFORM"

if [ "$PLATFORM" = "arm64" ]; then
  docker build --platform linux/arm64 --build-arg CONFD_PLATFORM=arm64 --build-arg CONFD_CHECKSUM=abd4b6a96b8af12a01e6c3063defec2655d5b817a74d43fb706c9ca8f814dd2e -t $IMAGE .
else
  docker build --platform linux/amd64 -t $IMAGE .
fi

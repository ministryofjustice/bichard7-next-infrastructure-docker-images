#!/bin/bash

set -e

IMAGE="nginx-auth-proxy"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

echo "Building for $PLATFORM"

if [ "$PLATFORM" = "arm64" ]; then
  docker build --platform linux/arm64 --build-arg ARCH=arm64 -t $IMAGE .
else
  docker build --platform linux/amd64 -t $IMAGE .
fi

#!/bin/bash

set -e

if [ -z "$TAG" ]; then
  TAG="latest"
fi

IMAGE="nodejs:$TAG"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

if [ "$PLATFORM" = "arm64" ]; then
  docker build --platform linux/arm64 --build-arg ARCH=arm64 -t "${IMAGE}" .

  # Build emulated x86 image
  EMULATED_IMAGE="$IMAGE-amd64"
  docker build --platform linux/amd64 --build-arg BUILD_IMAGE=amazon-linux2-base:latest-amd64 -t "${EMULATED_IMAGE}" .

else
  docker build --platform linux/amd64 -t $IMAGE .
fi

if [ "$SKIP_GOSS" = "true" ]; then
    echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
  if [ ! -z "$EMULATED_IMAGE" ]; then
    GOSS_SLEEP=15 dgoss run $EMULATED_IMAGE
  fi
fi

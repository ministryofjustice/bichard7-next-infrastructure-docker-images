#!/bin/bash

set -e

IMAGE="nodejs-2023"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

if [ "$PLATFORM" = "arm64" ]; then
  docker build --platform linux/arm64 --build-arg ARCH=arm64 -t "${IMAGE}" . 
else
  docker build --platform linux/amd64 -t $IMAGE .
fi

if [ "$SKIP_GOSS" = "true" ]; then
    echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

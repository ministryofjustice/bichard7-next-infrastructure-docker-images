#!/bin/bash

set -e

IMAGE="amazon-linux2023-base"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

if [ "$PLATFORM" = "arm64" ]; then
  docker build --platform linux/x86_64 -t $IMAGE .
else
  docker build -t "${IMAGE}" . 
fi

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  dgoss run $IMAGE
fi

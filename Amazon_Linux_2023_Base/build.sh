#!/bin/bash

set -e

IMAGE="amazon-linux2023-base"

if [ -n "$PLATFORM" ]; then
  docker build --platform "${PLATFORM}" -t "${IMAGE}" . 
else
  docker build -t "${IMAGE}" . 
fi

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  dgoss run $IMAGE
fi

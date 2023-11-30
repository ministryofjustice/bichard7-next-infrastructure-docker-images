#!/bin/bash

set -e

IMAGE="amazon-linux2-base"

docker build -t "${IMAGE}" .

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

# Always build an x86 image on arm to be used as a base image for other x86-only services
if [ $(arch) = "arm64" ]; then
  BUILD_ARGS="--platform linux/amd64"
  TAG="latest-amd64"
  IMAGE="$IMAGE:$TAG"

  docker build $BUILD_ARGS -t $IMAGE .

  if [ "$SKIP_GOSS" = "true" ]; then
    echo "Skipping dgoss tests"
  else
    dgoss run $IMAGE
  fi
fi

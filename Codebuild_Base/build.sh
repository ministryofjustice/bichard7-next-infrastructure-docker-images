#!/bin/bash

set -e

IMAGE="codebuild-base"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

echo "Building for $PLATFORM"

docker build --platform linux/${PLATFORM} -t "${IMAGE}" . 

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

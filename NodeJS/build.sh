#!/bin/bash

set -e

IMAGE="nodejs"

if [ "${PLATFORM}x" = "arm64x" ]; then
  docker build --platform linux/${PLATFORM} --build-arg BUILD_IMAGE=amazon-linux2-base:arm --build-arg ARCH=arm64 -t "${IMAGE}:arm" . 
else
  docker build -t $IMAGE . 
fi

if [[ "${SKIP_GOSS}x" == "truex" ]]; then
    echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

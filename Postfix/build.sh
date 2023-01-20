#!/bin/bash

set -e

IMAGE="postfix"

if [ "${PLATFORM}x" = "arm64x" ]; then
  docker build --platform linux/${PLATFORM} --build-arg BUILD_IMAGE=amazon-linux2-base:arm -t $IMAGE . 
else
  docker build -t $IMAGE . 
fi

if [[ "${SKIP_GOSS}x" == "truex" ]]; then
    echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi
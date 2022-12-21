#!/bin/bash

set -e

IMAGE="nginx-java-supervisord"

if [ "${PLATFORM}x" = "arm64x" ]; then
  docker build --platform linux/${PLATFORM} --build-arg BUILD_IMAGE=openjdk-jre11-slim:arm -t "${IMAGE}:arm" . 
else
  docker build -t $IMAGE . 
fi

if [[ "${SKIP_GOSS}x" == "truex" ]]; then
  echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

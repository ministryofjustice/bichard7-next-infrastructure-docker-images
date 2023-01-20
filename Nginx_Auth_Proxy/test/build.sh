#!/bin/bash

set -e

IMAGE="nginx-auth-test"

if [ "${PLATFORM}x" = "arm64x" ]; then
  docker build --platform linux/${PLATFORM} --build-arg BUILD_IMAGE=nodejs:arm -t $IMAGE . 
else
  docker build -t $IMAGE . 
fi

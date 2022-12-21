#!/bin/bash

set -e

IMAGE="nginx-auth-proxy"

if [ "${PLATFORM}x" = "arm64x" ]; then
  docker build --platform linux/${PLATFORM} --build-arg BUILD_IMAGE=amazon-linux2-base:arm --build-arg ARCH=arm64 -t "${IMAGE}:arm" . 
else
  docker build -t $IMAGE . 
fi

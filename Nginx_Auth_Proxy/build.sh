#!/bin/bash

set -e

IMAGE="nginx-auth-proxy"

if [ "${PLATFORM}x" = "arm64x" ]; then
  docker build --platform linux/${PLATFORM} --build-arg ARCH=arm64 -t $IMAGE . 
else
  docker build -t $IMAGE . 
fi

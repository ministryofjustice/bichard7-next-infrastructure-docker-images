#!/bin/bash

set -e

IMAGE="openjdk-jre11-slim"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

echo "Building for $PLATFORM"

if [ "$PLATFORM" = "arm64" ]; then
  docker build --platform linux/arm64 --build-arg JAVA_URL=https://github.com/AdoptOpenJDK/openjdk11-upstream-binaries/releases/download/jdk-11.0.16%2B8/OpenJDK11U-jre_aarch64_linux_11.0.16_8.tar.gz -t $IMAGE .
else
  docker build --platform linux/amd64 -t $IMAGE .
fi

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

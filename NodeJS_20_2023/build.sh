#!/bin/bash

set -e

IMAGE="nodejs-24-2025"
source $(dirname $0)/scripts/node_version.sh
ARCH=$(arch)

echo "Building Node version: ${NODE_VERSION} and for $ARCH"

if [ "$ARCH" = "arm64" ]; then
  docker build $BUILD_ARGS --build-arg NODE_VERSION=$NODE_VERSION --build-arg ARCH=arm64 -t $IMAGE .
else
  docker build $BUILD_ARGS --build-arg NODE_VERSION=$NODE_VERSION --build-arg ARCH=x64 -t $IMAGE .
fi

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  dgoss run $IMAGE
fi

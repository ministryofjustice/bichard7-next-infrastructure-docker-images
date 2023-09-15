#!/bin/bash

set -e

IMAGE="nodejs-2023"
BUILD_ARGS=""

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

if [ "$PLATFORM" = "arm64" ]; then
  BUILD_ARGS="--build-arg ARCH=arm64"
fi

docker build $BUILD_ARGS -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
    echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi


IMAGE="nodejs-20-2023"
source $(dirname $0)/scripts/node_version_v20.sh

echo "Building Node version: ${NODE_VERSION}"
docker build $BUILD_ARGS --build-arg NODE_VERSION=$NODE_VERSION -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
    echo "Skipping dgoss tests"
else
  GOSS_FILE="goss-v20.yaml" GOSS_SLEEP=15 dgoss run $IMAGE
fi

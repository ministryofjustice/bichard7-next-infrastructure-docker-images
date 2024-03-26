#!/bin/bash

set -e

IMAGE="nodejs-20-2023"
source $(dirname $0)/scripts/node_version.sh
ARCH=$(arch)

echo "Building Node version: ${NODE_VERSION}"
docker build $BUILD_ARGS --build-arg NODE_VERSION=$NODE_VERSION --build-arg ARCH=$ARCH -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  dgoss run $IMAGE
fi

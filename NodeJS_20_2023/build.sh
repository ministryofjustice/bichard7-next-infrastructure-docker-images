#!/bin/bash

set -e

IMAGE="nodejs-20-2023"
source $(dirname $0)/scripts/node_version.sh

echo "Building Node version: ${NODE_VERSION}"
docker build $BUILD_ARGS --build-arg NODE_VERSION=$NODE_VERSION -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
    echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

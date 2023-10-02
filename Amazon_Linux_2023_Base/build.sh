#!/bin/bash

set -e

IMAGE="amazon-linux2023-base"

docker build -t "${IMAGE}" . 

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  dgoss run $IMAGE
fi

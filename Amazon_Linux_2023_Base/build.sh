#!/bin/bash

set -e

IMAGE="amazon-linux2023-base"

docker build -t "${IMAGE}" . 

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

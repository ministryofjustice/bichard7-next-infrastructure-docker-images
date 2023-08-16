#!/bin/bash

set -e

IMAGE="nginx-nodejs-2023-supervisord"

docker build -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
    echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run $IMAGE
fi

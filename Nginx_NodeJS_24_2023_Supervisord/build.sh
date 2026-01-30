#!/bin/bash

set -e

IMAGE="nginx-nodejs-24-2023-supervisord"

docker build -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
        echo "Skipping dgoss tests"
else
        dgoss run $IMAGE
fi

#!/bin/bash

image=nginx-nodejs-supervisord

set -e;
if [[ $(arch) = "arm64" ]]; then
  echo "Building for ARM";
  docker build --platform linux/amd64 -t "$image" . ;
else
  echo "Building regular image";
  docker build -t "$image" . ;
fi
if [[ "${SKIP_GOSS}x" == "truex" ]]; then
    echo "Skipping dgoss tests";
else
  GOSS_SLEEP=15 dgoss run $image;
fi


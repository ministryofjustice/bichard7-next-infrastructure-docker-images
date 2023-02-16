#!/bin/bash

set -ex

IMAGE="conductor"

/bin/bash scripts/download_and_patch_conductor.sh

if [ "${PLATFORM}x" = "arm64x" ]; then
  docker build --platform linux/${PLATFORM} --build-arg CONFD_CHECKSUM=abd4b6a96b8af12a01e6c3063defec2655d5b817a74d43fb706c9ca8f814dd2e --build-arg CONFD_PLATFORM=arm64 -t "${IMAGE}-arm" .
else
  docker build -t $IMAGE .
fi

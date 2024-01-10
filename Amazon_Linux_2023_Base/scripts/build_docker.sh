#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="amazon-linux2023-base"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux-2023"

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

aws codebuild start-build --project-name "build-nodejs-2023-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nodejs-2023"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2023-base"

/bin/bash ../scripts/build_and_push_image.sh

aws codebuild start-build --project-name "build-nginx-nodejs-2023-supervisord-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT


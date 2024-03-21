#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-nodejs-20-2023-supervisord"
export readonly SOURCE_REPOSITORY_NAME="nodejs-20-2023"

/bin/bash ../scripts/build_and_push_image.sh

aws codebuild start-build --project-name "build-s3-web-proxy" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

aws codebuild start-build --project-name "build-user-service-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

aws codebuild start-build --project-name "build-ui-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nodejs"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

aws codebuild start-build --project-name "build-nginx-nodejs-supervisord-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

aws codebuild start-build --project-name "build-codebuild-base"

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="amazon-linux2-base"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2"

/bin/bash ../scripts/build_and_push_image.sh

aws codebuild start-build --project-name "build-nodejs-16-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

aws codebuild start-build --project-name "build-nginx-supervisord-docker"

aws codebuild start-build --project-name "build-postfix-docker"

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="openjdk-jre11-slim"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"

/bin/bash ../scripts/build_and_push_image.sh

aws codebuild start-build --project-name "build-nginx-java-supervisord-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

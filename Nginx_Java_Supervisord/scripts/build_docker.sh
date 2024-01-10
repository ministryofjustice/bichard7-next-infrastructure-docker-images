#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-java-supervisord"
export readonly SOURCE_REPOSITORY_NAME="openjdk-jre11-slim"

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

aws codebuild start-build --project-name "build-prometheus-cloudwatch-exporter-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

aws codebuild start-build --project-name "build-prometheus-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

aws codebuild start-build --project-name "build-prometheus-blackbox-exporter-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

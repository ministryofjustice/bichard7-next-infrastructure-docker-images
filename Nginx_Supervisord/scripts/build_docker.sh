#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-supervisord"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

aws codebuild start-build --project-name "build-nginx-auth-proxy-docker"

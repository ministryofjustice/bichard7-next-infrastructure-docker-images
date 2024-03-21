#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nodejs"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"

/bin/bash ../scripts/build_and_push_image.sh

aws codebuild start-build --project-name "build-codebuild-base"

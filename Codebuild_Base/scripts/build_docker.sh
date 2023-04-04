#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="codebuild-base"
export readonly SOURCE_REPOSITORY_NAME="nodejs"

LATEST_TERRAFORM_CLI_VERSION="1.4.4"
export BUILD_ARGS="--build-arg TERRAFORM_VERSION=${LATEST_TERRAFORM_CLI_VERSION}"

/bin/bash ../scripts/build_and_push_image.sh

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="codebuild-2023-base"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2023-base"

LATEST_TERRAFORM_CLI_VERSION="1.8.4"
export BUILD_ARGS="--build-arg TERRAFORM_VERSION=${LATEST_TERRAFORM_CLI_VERSION}"

/bin/bash ../scripts/build_and_push_image.sh

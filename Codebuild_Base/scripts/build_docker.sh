#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="codebuild-base"
export readonly SOURCE_REPOSITORY_NAME="nodejs"
LATEST_TERRAFORM_CLI_VERSION=$(curl --silent https://github.com/hashicorp/terraform/releases/latest | grep -Eo 'v.*\"' | sed 's/^v\(.*\)\"$/\1/')
export BUILD_ARGS="--build-arg TERRAFORM_VERSION=${LATEST_TERRAFORM_CLI_VERSION}"

/bin/bash ../scripts/build_and_push_image.sh

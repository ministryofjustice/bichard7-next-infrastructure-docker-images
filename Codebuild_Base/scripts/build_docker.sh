#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="codebuild-base"
export readonly SOURCE_REPOSITORY_NAME="nodejs"
LATEST_TERRAFORM_CLI_VERSION=$(curl --silent -L https://github.com/hashicorp/terraform/releases/latest -w %\{url_effective\} | tail -1 | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
export BUILD_ARGS="--build-arg TERRAFORM_VERSION=${LATEST_TERRAFORM_CLI_VERSION}"

/bin/bash ../scripts/build_and_push_image.sh

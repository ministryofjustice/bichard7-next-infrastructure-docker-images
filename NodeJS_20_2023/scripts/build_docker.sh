#!/usr/bin/env bash

set -e

source $(dirname $0)/node_version.sh
export readonly REPOSITORY_NAME="nodejs-20-2023"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2023-base"
export BUILD_ARGS="--build-arg NODE_VERSION=${NODE_VERSION}"

/bin/bash ../scripts/build_and_push_image.sh

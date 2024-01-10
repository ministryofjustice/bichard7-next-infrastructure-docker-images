#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="postfix"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"

export GOSS_ENV=""
../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="postfix"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2023-base"

export GOSS_ENV=""
/bin/bash ../scripts/build_and_push_image.sh

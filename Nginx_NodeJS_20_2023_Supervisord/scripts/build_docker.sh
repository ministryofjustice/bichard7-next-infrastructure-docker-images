#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-nodejs-20-2023-supervisord"
export readonly SOURCE_REPOSITORY_NAME="nodejs-20-2023"

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

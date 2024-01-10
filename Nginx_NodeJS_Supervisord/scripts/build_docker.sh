#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-nodejs-supervisord"
export readonly SOURCE_REPOSITORY_NAME="nodejs"

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-auth-proxy"
export readonly SOURCE_REPOSITORY_NAME="nginx-supervisord"

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

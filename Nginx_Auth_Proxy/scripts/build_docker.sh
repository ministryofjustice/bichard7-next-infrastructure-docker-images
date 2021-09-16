#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-auth-proxy"
export readonly SOURCE_REPOSITORY_NAME="nginx-supervisord"

/bin/bash ../scripts/build_and_push_image.sh

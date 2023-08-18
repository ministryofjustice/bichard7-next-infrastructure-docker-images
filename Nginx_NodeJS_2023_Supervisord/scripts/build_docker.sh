#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-nodejs-2023-supervisord"
export readonly SOURCE_REPOSITORY_NAME="nodejs-2023"

/bin/bash ../scripts/build_and_push_image.sh

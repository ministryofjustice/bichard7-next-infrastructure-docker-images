#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-nodejs-supervisord"
export readonly SOURCE_REPOSITORY_NAME="nodejs"

/bin/bash ../scripts/build_and_push_image.sh

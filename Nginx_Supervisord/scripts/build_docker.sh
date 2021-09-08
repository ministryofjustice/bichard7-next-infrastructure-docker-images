#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-supervisord"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"

/bin/bash ../scripts/build_and_push_image.sh

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="grafana"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"
export GOSS_ENV="-e ALERTMANAGER_URL=localhost"

/bin/bash ../scripts/build_and_push_image.sh

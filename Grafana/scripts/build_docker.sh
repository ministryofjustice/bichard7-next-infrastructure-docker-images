#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="grafana"
export readonly SOURCE_REPOSITORY_NAME="grafana-staged"

/bin/bash ../scripts/build_and_push_image.sh

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="prometheus"
export readonly SOURCE_REPOSITORY_NAME="nginx-java-supervisord"

export GOSS_ENV="-e RETENTION_DAYS=1  -e HTPASSWD=test"
/bin/bash ../scripts/build_and_push_image.sh

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="prometheus"
export readonly SOURCE_REPOSITORY_NAME="nginx-java-supervisord"

export GOSS_ENV="-e RETENTION_DAYS=1  -e HTPASSWD=test"
../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

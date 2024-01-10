#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="prometheus-cloudwatch-exporter"
export readonly SOURCE_REPOSITORY_NAME="nginx-java-supervisord"

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

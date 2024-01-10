#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="logstash"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"
export readonly GOSS_SLEEP=120

../scripts/build_image.sh && ../scripts/test_image.sh && ../scripts/push_image.sh

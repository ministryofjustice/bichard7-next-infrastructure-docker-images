#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="prometheus-blackbox-exporter"
export readonly SOURCE_REPOSITORY_NAME="nginx-java-supervisord"

/bin/bash ../scripts/build_and_push_image.sh

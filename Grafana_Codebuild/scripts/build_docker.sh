#!/usr/bin/env bash

set -ex

export readonly REPOSITORY_NAME="grafana-codebuild"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2-base"
LATEST_GRAFANA_VERSION=$(curl --silent https://github.com/grafana/grafana/releases | grep /tag/v8 | head -1 | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
LATEST_CONFD_VERSION=$(curl --silent -L https://github.com/kelseyhightower/confd/releases/latest -w %\{url_effective\} | tail -1 | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
export BUILD_ARGS="--build-arg GRAFANA_VERSION=${LATEST_GRAFANA_VERSION} --build-arg CONFD_VERSION=${LATEST_CONFD_VERSION}"

/bin/bash ../scripts/build_and_push_image.sh

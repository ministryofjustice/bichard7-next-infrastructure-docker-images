#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nodejs"
export readonly SOURCE_REPOSITORY_NAME="codebuild-base"

/bin/bash ../scripts/build_and_push_image.sh

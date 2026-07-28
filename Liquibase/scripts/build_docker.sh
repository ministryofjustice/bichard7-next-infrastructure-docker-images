#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="liquibase"
export readonly SOURCE_REPOSITORY_NAME="liquibase-upstream"

/bin/bash ../scripts/build_and_push_image.sh

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="conductor"
export readonly SOURCE_REPOSITORY_NAME="nginx-java-supervisord"

export readonly GOSS_ENV="-e CJSE_CONDUCTOR_UI_USERNAME='conductor' -e CJSE_CONDUCTOR_UI_PASSWORD='password'"

/bin/bash ../scripts/build_and_push_image.sh

#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="conductor"
export readonly SOURCE_REPOSITORY_NAME="amazon-linux2023-base"

export readonly GOSS_ENV="-e CJSE_CONDUCTOR_UI_USERNAME=bichard -e CJSE_CONDUCTOR_UI_PASSWORD=password -e CJSE_CONDUCTOR_ENABLE_HTTP=true -e SPRING_DATASOURCE_URL=jdbc:postgresql://goss-postgres:5432/postgres -e SPRING_DATASOURCE_USERNAME=postgres -e SPRING_DATASOURCE_PASSWORD=password -e AWS_ACCESS_KEY_ID=FAKE -e AWS_REGION=eu-west-2 -e AWS_SECRET_ACCESS_KEY=FAKE -e CONDUCTOR_EVENTQUEUES_SQS_ENDPOINT=http://goss-localstack:4566"
export readonly BUILD_ARGS="--build-arg CONDUCTOR_VERSION=$(cat conductor_version)"

/bin/bash ../scripts/build_and_push_image.sh

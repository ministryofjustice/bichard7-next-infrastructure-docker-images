#!/usr/bin/env bash

set -ex

export readonly DOCKER_IMAGE="${REPOSITORY_NAME}:latest"

## Test image steps
echo "Running trivy tests against ${DOCKER_IMAGE}"
/bin/bash  ../scripts/run_trivy_tests.sh
echo "Running goss tests against ${DOCKER_IMAGE}"
/bin/bash ../scripts/run_goss_tests.sh

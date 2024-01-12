#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="conductor"
export readonly DOCKER_IMAGE="conductor"

bash ../scripts/install_goss.sh
make -C ../ Conductor
bash ../scripts/run_trivy_tests.sh
bash ../scripts/push_image.sh

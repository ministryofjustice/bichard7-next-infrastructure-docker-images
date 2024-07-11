#!/usr/bin/env bash

set -e

install_trivy() {
  echo "Pulling trivy binary from s3"
  aws s3 cp --quiet \
    s3://"${ARTIFACT_BUCKET}"/trivy/binary/trivy_latest_Linux-64bit.rpm \
    .

  echo "Installing trivy binary"
  yum localinstall -y trivy_latest_Linux-64bit.rpm
}

uname -a

mkdir -p trivy/db
install_trivy

trivy image --download-db-only

TRIVY_CACHE_DIR=trivy trivy image \
    --severity CRITICAL \
    --exit-code 1 \
    --ignorefile ./.trivyignore \
    --timeout 180m \
  ${DOCKER_IMAGE}

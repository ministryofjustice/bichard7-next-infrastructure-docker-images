#!/usr/bin/env bash

set -e

install_trivy() {
  echo "Pulling trivy binary from s3"
  aws s3 cp \
    s3://"${ARTIFACT_BUCKET}"/trivy/binary/trivy_latest_Linux-64bit.rpm \
    .

  echo "Installing trivy binary"
  yum localinstall -y trivy_latest_Linux-64bit.rpm
}

pull_trivy_db() {
  echo "Pulling trivy db from s3..."
  aws s3 cp \
    s3://"${ARTIFACT_BUCKET}"/trivy/db/trivy-offline.db.tgz \
    trivy/db/

  echo "Extracting trivy db to `pwd`/trivy/db/"
  tar -xvf trivy/db/trivy-offline.db.tgz -C trivy/db/
}

uname -a

mkdir -p trivy/db
install_trivy
pull_trivy_db

TRIVY_CACHE_DIR=trivy trivy image \
    --severity CRITICAL \
    --exit-code 1 \
    --ignorefile ./.trivyignore \
    --skip-update \
    --timeout 180m \
  ${DOCKER_IMAGE}

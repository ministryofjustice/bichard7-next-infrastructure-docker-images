#!/usr/bin/env bash

set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

install_trivy() {
  echo "Installing trivy binary"
  TRIVY_VERSION=$(get_latest_release "aquasecurity/trivy" | sed 's/v//')
  echo "Installing trivy version ${TRIVY_VERSION}"
  yum install -y https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.rpm
}

uname -a

install_trivy

trivy image ${DOCKER_IMAGE}

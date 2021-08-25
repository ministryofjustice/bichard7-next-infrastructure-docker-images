#!/usr/bin/env bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

VERSION=$(get_latest_release "prometheus/blackbox_exporter" | sed 's/v//' | sed 's/cloudwatch_exporter-//')
echo ${VERSION}

cd /tmp
wget https://github.com/prometheus/blackbox_exporter/releases/download/v${VERSION}/blackbox_exporter-${VERSION}.linux-amd64.tar.gz
tar -xf /tmp/blackbox_exporter-${VERSION}.linux-amd64.tar.gz
mv /tmp/blackbox_exporter-${VERSION}.linux-amd64/blackbox_exporter /bin/.


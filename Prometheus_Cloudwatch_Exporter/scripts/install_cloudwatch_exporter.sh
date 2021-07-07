#!/usr/bin/env bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

VERSION=$(get_latest_release "prometheus/cloudwatch_exporter" | sed 's/v//' | sed 's/cloudwatch_exporter-//')
echo ${VERSION}

wget https://repo1.maven.org/maven2/io/prometheus/cloudwatch/cloudwatch_exporter/${VERSION}/cloudwatch_exporter-${VERSION}-jar-with-dependencies.jar
mv cloudwatch_exporter-${VERSION}-jar-with-dependencies.jar /cloudwatch_exporter.jar

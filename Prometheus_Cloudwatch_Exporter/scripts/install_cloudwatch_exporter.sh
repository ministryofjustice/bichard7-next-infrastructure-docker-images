#!/usr/bin/env bash

# Current 0.12 release is not on maven we are pinning to 0.11
#get_latest_release() {
#  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
#    grep '"tag_name":' |                                            # Get tag line
#    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
#}
#
#VERSION=$(get_latest_release "prometheus/cloudwatch_exporter" | sed 's/v//' | sed 's/cloudwatch_exporter-//')
#echo ${VERSION}
readonly VERSION="0.11.0"

wget https://repo1.maven.org/maven2/io/prometheus/cloudwatch/cloudwatch_exporter/${VERSION}/cloudwatch_exporter-${VERSION}-jar-with-dependencies.jar
wget https://repo1.maven.org/maven2/io/prometheus/cloudwatch/cloudwatch_exporter/${VERSION}/cloudwatch_exporter-${VERSION}-jar-with-dependencies.jar.md5
CHECKSUM=$(cat cloudwatch_exporter-${VERSION}-jar-with-dependencies.jar.md5 | tr -d '')
FILE_CHECKSUM=$(cat cloudwatch_exporter-${VERSION}-jar-with-dependencies.jar.md5 | cut -d' ' -f1 | tr -d '')
if [ "${CHECKSUM}" != "${FILE_CHECKSUM}" ]; then
  exit 1
fi
mv cloudwatch_exporter-${VERSION}-jar-with-dependencies.jar /cloudwatch_exporter.jar

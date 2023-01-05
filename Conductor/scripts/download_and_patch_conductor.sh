#!/bin/bash

set -e

ARCHIVE_NAME=conductor.tar.gz
BASE_DIR=$(readlink -f $(dirname $0)/..)
BUILD_DIR=$BASE_DIR/conductor
CONDUCTOR_VERSION="$(cat $BASE_DIR/conductor_version)"
DOWNLOAD_URL="https://github.com/Netflix/conductor/archive/refs/tags/${CONDUCTOR_VERSION}.tar.gz"

if [ ! -d $BUILD_DIR ]
then
  curl -L -o $BASE_DIR/$ARCHIVE_NAME $DOWNLOAD_URL
  mkdir -p $BUILD_DIR
  tar -xzf $BASE_DIR/$ARCHIVE_NAME -C $BUILD_DIR --strip-components 1
  rm $ARCHIVE_NAME
  patch -u $BUILD_DIR/server/build.gradle -i $BASE_DIR/patches/add-postgres-support.patch
  patch -u $BUILD_DIR/build.gradle -i $BASE_DIR/patches/remove-nebula-plugin.patch
fi

#!/bin/bash

set -ex

CONDUCTOR_VERSION="v3.13.2"
DOWNLOAD_URL="https://github.com/Netflix/conductor/archive/refs/tags/${CONDUCTOR_VERSION}.tar.gz"
SCRIPTPATH=$(dirname "$0")
ARCHIVE_NAME=conductor.tar.gz
BUILD_DIR=$SCRIPTPATH/conductor

IMAGE="conductor:${CONDUCTOR_VERSION}"

download_and_patch_conductor() {
  if [ ! -d $BUILD_DIR ]
  then
    curl -L -o $SCRIPTPATH/$ARCHIVE_NAME $DOWNLOAD_URL
    mkdir -p $SCRIPTPATH/conductor
    tar -xzf $SCRIPTPATH/$ARCHIVE_NAME -C $BUILD_DIR --strip-components 1
    rm $ARCHIVE_NAME
    patch -u $BUILD_DIR/server/build.gradle -i $SCRIPTPATH/patches/add-postgres-support.patch
    patch -u $BUILD_DIR/build.gradle -i $SCRIPTPATH/patches/remove-nebula-plugin.patch
  fi
}

build_docker(){
  if [ "${PLATFORM}x" = "arm64x" ]; then
    docker build --platform linux/${PLATFORM} --build-arg CONFD_CHECKSUM=abd4b6a96b8af12a01e6c3063defec2655d5b817a74d43fb706c9ca8f814dd2e --build-arg CONFD_PLATFORM=arm64 --build-arg BUILD_IMAGE=nginx-java-supervisord:arm -t "${IMAGE}-arm" . 
  else
    docker build -t $IMAGE . 
  fi
}

download_and_patch_conductor
build_docker

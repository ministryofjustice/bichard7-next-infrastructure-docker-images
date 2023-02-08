#!/bin/bash

set -e

BASE_DIR=$(readlink -f $(dirname $0)/..)

CONDUCTOR_VERSION=$(cat "$BASE_DIR/conductor_version")
COMMUNITY_VERSION="main"

COMMUNITY_ARCHIVE_NAME=community.tar.gz
COMMUNITY_BUILD_DIR="$BASE_DIR/community"
COMMUNITY_DOWNLOAD_URL="https://github.com/Netflix/conductor-community/archive/refs/heads/${COMMUNITY_VERSION}.tar.gz"

CONDUCTOR_ARCHIVE_NAME=conductor.tar.gz
CONDUCTOR_BUILD_DIR="$BASE_DIR/conductor"
CONDUCTOR_DOWNLOAD_URL="https://github.com/Netflix/conductor/archive/refs/tags/${CONDUCTOR_VERSION}.tar.gz"

if [ ! -d $CONDUCTOR_BUILD_DIR ]
then
  curl -L -o "$BASE_DIR/$CONDUCTOR_ARCHIVE_NAME" "$CONDUCTOR_DOWNLOAD_URL"
  mkdir -p "$CONDUCTOR_BUILD_DIR"
  tar -xzf "$BASE_DIR/$CONDUCTOR_ARCHIVE_NAME" -C "$CONDUCTOR_BUILD_DIR" --strip-components 1
  rm "$CONDUCTOR_ARCHIVE_NAME"
fi

if [ ! -d $COMMUNITY_BUILD_DIR ]
then
  curl -L -o "$BASE_DIR/$COMMUNITY_ARCHIVE_NAME" "$COMMUNITY_DOWNLOAD_URL"
  mkdir -p "$COMMUNITY_BUILD_DIR"
  tar -xzf "$BASE_DIR/$COMMUNITY_ARCHIVE_NAME" -C "$COMMUNITY_BUILD_DIR" --strip-components 1
  rm "$COMMUNITY_ARCHIVE_NAME"
  rm "$COMMUNITY_BUILD_DIR/community-server/build.gradle"
  cp "$BASE_DIR/patches/build.gradle" "$COMMUNITY_BUILD_DIR/community-server/build.gradle"
  # patch -u "$COMMUNITY_BUILD_DIR/server/build.gradle" -i "$BASE_DIR/patches/add-postgres-support.patch"
fi

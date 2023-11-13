#!/usr/bin/env bash

set -e

VERSION=v0.3.23
# this is ran on circleci
if [ ! -f "/usr/local/bin/goss" ]; then
  curl --output -L "https://github.com/goss-org/goss/releases/download/${VERSION}/goss-linux-amd64"
  chmod +rx /usr/local/bin/goss
fi
if [ ! -f "/usr/local/bin/dgoss" ]; then
  curl -L https://github.com/aelsabbahy/goss/releases/latest/download/dgoss -o /usr/local/bin/dgoss
  chmod +rx /usr/local/bin/dgoss
fi

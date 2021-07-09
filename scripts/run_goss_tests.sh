#!/usr/bin/env bash

set -e

if [ ! -f "/usr/local/bin/goss" ]; then
  curl -L https://github.com/aelsabbahy/goss/releases/latest/download/goss-linux-amd64 -o /usr/local/bin/goss
  chmod +rx /usr/local/bin/goss
fi
if [ ! -f "/usr/local/bin/dgoss" ]; then
  curl -L https://github.com/aelsabbahy/goss/releases/latest/download/dgoss -o /usr/local/bin/dgoss
  chmod +rx /usr/local/bin/dgoss
fi

GOSS_SLEEP=15 dgoss run ${GOSS_ENV} ${DOCKER_IMAGE}

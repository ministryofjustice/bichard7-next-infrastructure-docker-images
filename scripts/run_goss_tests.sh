#!/usr/bin/env bash

curl -L https://github.com/aelsabbahy/goss/releases/latest/download/goss-linux-amd64 -o /usr/local/bin/goss
chmod +rx /usr/local/bin/goss
curl -L https://github.com/aelsabbahy/goss/releases/latest/download/dgoss -o /usr/local/bin/dgoss
chmod +rx /usr/local/bin/dgoss

GOSS_SLEEP=15 dgoss run ${DOCKER_IMAGE}

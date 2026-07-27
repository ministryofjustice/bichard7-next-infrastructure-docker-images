#!/usr/bin/env bash
set -e
# this is ran on circleci
if [ ! -f "/usr/local/bin/goss" ]; then
  curl --silent -L https://github.com/aelsabbahy/goss/releases/download/v0.4.9/goss-linux-amd64 -o /usr/local/bin/goss
  chmod +rx /usr/local/bin/goss
fi
if [ ! -f "/usr/local/bin/dgoss" ]; then
  curl --silent -L https://github.com/aelsabbahy/goss/releases/download/v0.4.9/dgoss -o /usr/local/bin/dgoss
  chmod +rx /usr/local/bin/dgoss
fi

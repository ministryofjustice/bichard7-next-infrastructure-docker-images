#!/usr/bin/env bash

set -e

export readonly REPOSITORY_NAME="nginx-scan-portal"
export readonly SOURCE_REPOSITORY_NAME="nginx-nodejs-supervisord"

export GOSS_ENV="-e AWS_ACCESS_KEY_ID='' -e AWS_SECRET_ACCESS_KEY='' -e S3_BUCKET_NAME='dummy' -e HTPASSWD=test"
/bin/bash ../scripts/_image.sh

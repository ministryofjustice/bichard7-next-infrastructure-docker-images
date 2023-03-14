#!/bin/bash

set -e

IMAGE="s3-web-proxy"

if [ -z "$PLATFORM" ]; then
  PLATFORM=$(arch)
fi

echo "Building for $PLATFORM"

docker build --platform linux/${PLATFORM} -t $IMAGE .

if [ "$SKIP_GOSS" = "true" ]; then
  echo "Skipping dgoss tests"
else
  GOSS_SLEEP=15 dgoss run \
    -e AWS_ACCESS_KEY_ID='' \
		-e AWS_SECRET_ACCESS_KEY='' \
		-e S3_BUCKET_NAME='dummy' \
		-e HTPASSWD=test $IMAGE
fi

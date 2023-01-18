#!/bin/bash

set -e

IMAGE="nginx-supervisord"

if [ "${PLATFORM}x" = "arm64x" ]; then
  docker build --platform linux/${PLATFORM} --build-arg CONFD_PLATFORM=arm64 --build-arg CONFD_CHECKSUM=abd4b6a96b8af12a01e6c3063defec2655d5b817a74d43fb706c9ca8f814dd2e -t $IMAGE . 
else
  docker build -t $IMAGE . 
fi

if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
    echo "Skipping dgoss tests"; \
else \
  GOSS_SLEEP=15 dgoss run -e \
  CJSE_NGINX_USERSERVICE_DOMAIN="localhost/elb-status" \
  -e CJSE_NGINX_APP_DOMAIN="localhost/elb-status" \
  $IMAGE; \
fi

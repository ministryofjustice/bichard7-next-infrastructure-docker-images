#!/bin/bash

ARCH=`arch`

image=amazon-linux2-base

if [ $ARCH = "arm64" ]
then
    echo "Building for ARM"
    docker build --platform linux/amd64 -t "$image" . ;\
else
    echo "Building regular image"
    set -e; \
	docker build -t "$image" . ;\
fi

if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
    echo "Skipping dgoss tests"; \
else \
    GOSS_SLEEP=15 dgoss run $image; \
fi

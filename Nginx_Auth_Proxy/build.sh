#!/bin/bash

ARCH=`arch`

image=nginx-auth-proxy

if [ $ARCH = "arm64" ]
then
    echo "Building for ARM"
    docker build --platform linux/amd64 -t "$image" .
else
	docker build -t "$image" .
fi

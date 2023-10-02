SHELL := /bin/bash # Use bash syntax

image = amzn2023-java17-nginx-supervisord
skip_goss = ${SKIP_GOSS}

.PHONY: build
build: build-docker goss

.PHONY: build-docker
build-docker:
	docker build -t $(image) .

.PHONY: goss
goss:
ifeq ($(skip_goss),true)
	echo "Skipping goss tests"
else
	dgoss run $(image)
endif

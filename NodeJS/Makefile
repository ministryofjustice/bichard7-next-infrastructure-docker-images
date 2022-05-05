SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = nodejs

build:
	set -e; \
	docker build --platform linux/amd64 -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
  		echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run $(image); \
	fi

buildx:
	docker build --platform linux/arm64 --build-arg BUILD_IMAGE=amazon-linux2-base:arm --build-arg ARCH=arm64 -t "$(image):arm" .

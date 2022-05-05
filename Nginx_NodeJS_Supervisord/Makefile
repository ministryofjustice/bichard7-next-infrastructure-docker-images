SHELL := /bin/bash # Use bash syntax

image = nginx-nodejs-supervisord

.PHONY: build
build:
	set -e; \
	docker build --platform linux/amd64 -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
		echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run $(image); \
	fi

.PHONY: buildx
buildx:
	docker build --platform linux/arm64 --build-arg BUILD_IMAGE=nodejs:arm -t "$(image):arm" .

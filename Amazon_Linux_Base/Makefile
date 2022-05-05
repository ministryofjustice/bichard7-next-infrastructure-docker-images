SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = amazon-linux2-base

build:
	set -e; \
	docker build --platform linux/amd64 -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
	  echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run $(image); \
	fi

buildx:
	docker build --platform linux/arm64 -t "$(image):arm" .

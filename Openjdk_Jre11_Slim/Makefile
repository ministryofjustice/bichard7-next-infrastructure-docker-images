SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = openjdk-jre11-slim

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "x" ]]; then \
		GOSS_SLEEP=15 dgoss run $(image); \
	else \
	  echo "Skipping dgoss tests"; \
	fi \

SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = amazon-linux2-base

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "x" ]]; then \
		GOSS_SLEEP=15 dgoss run $(image); \
	else \
	  echo "Skipping dgoss tests"; \
	fi \

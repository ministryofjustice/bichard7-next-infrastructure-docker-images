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

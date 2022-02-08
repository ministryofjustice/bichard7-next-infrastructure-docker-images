SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = nginx-java-supervisord

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
  		echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run $(image); \
	fi

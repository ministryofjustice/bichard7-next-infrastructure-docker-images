SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = logstash

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "x" ]]; then \
		GOSS_SLEEP=120 dgoss run -e CJSE_LOGSTASH_LOCAL=true $(image); \
	else \
	  echo "Skipping dgoss tests"; \
	fi \

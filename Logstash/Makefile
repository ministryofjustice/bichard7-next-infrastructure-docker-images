SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = logstash

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
		echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=120 dgoss run \
		-e CJSE_LOGSTASH_LOCAL=true \
		$(image); \
	fi

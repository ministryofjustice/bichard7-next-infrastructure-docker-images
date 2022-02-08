SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = prometheus

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
	  	echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run \
		-e RETENTION_DAYS=1 \
		-e HTPASSWD=test \
		-e ARN_PREFIX='' \
		$(image); \
	fi

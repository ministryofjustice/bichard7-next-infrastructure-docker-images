SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = scanning-results-portal

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
	  	echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run \
		-e AWS_ACCESS_KEY_ID='' \
		-e AWS_SECRET_ACCESS_KEY='' \
		-e S3_BUCKET_NAME='dummy' \
		-e HTPASSWD=test \
		$(image); \
	fi

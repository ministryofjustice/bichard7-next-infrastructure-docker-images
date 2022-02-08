SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = nginx-supervisord

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "x" ]]; then \
		GOSS_SLEEP=15 dgoss run -e \
		CJSE_NGINX_USERSERVICE_DOMAIN="localhost/elb-status" \
		-e CJSE_NGINX_APP_DOMAIN="localhost/elb-status" \
		$(image); \
	else \
	  echo "Skipping dgoss tests"; \
	fi \

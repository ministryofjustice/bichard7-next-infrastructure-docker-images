SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = nginx-supervisord

build:
	set -e; \
	docker build --platform linux/amd64 -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
		echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run -e \
		CJSE_NGINX_USERSERVICE_DOMAIN="localhost/elb-status" \
		-e CJSE_NGINX_APP_DOMAIN="localhost/elb-status" \
		$(image); \
	fi

buildx:
	docker build --platform linux/arm64 --build-arg BUILD_IMAGE=amazon-linux2-base:arm --build-arg ARCH=arm64 --build-arg CONFD_CHECKSUM=23d8b7796def38821394033e40b48f001b0271a072a5436397ccc57806dbf1f7 -t "$(image):arm" .

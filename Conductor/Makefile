SHELL := /bin/bash # Use bash syntax
image = conductor

.PHONY: build
build: build-conductor-community

.PHONY: build-conductor
build-conductor:
	bash ./build.sh conductor

.PHONY: build-conductor-community
build-conductor-community:
	bash ./build.sh conductor-community

.PHONY: clean
clean:
	rm -rf conductor

.PHONY: goss
goss:
	set -e; \
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
	  echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run \ \
			-e CJSE_NGINX_PROXYSSLVERIFY="off" \
			$(image); \
	fi

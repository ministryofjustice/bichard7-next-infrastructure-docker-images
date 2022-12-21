SHELL := /bin/bash # Use bash syntax
image = conductor

.PHONY: build
build:
	bash ./build.sh

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

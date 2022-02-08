SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = grafana

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "x" ]]; then \
		GOSS_SLEEP=15 dgoss run -e ALERTMANAGER_URL=localhost $(image); \
	else \
	  echo "Skipping dgoss tests"; \
	fi \

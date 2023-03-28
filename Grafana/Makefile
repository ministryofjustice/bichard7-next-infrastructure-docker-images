SHELL := /bin/bash # Use bash syntax
.PHONY: build

image = grafana

build:
	set -e; \
	docker build -t "$(image)" . ;\
	if [[ "${SKIP_GOSS}x" == "truex" ]]; then \
		echo "Skipping dgoss tests"; \
	else \
		GOSS_SLEEP=15 dgoss run \
		-e ALERTMANAGER_URL=localhost \
		$(image); \
	fi

run:
	./scripts/run_locally.sh

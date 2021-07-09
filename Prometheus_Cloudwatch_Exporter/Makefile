.PHONY: build

image = prometheus-cloudwatch-exporter

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run $(image)"

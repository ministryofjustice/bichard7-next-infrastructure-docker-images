.PHONY: build

image = logstash

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=120 dgoss run -e CJSE_LOGSTASH_LOCAL=true $(image)"

.PHONY: build

image = logstash

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run $(image)"

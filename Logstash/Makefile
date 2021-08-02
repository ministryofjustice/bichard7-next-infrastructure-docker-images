.PHONY: build

image = logstash

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=60 dgoss run $(image)"

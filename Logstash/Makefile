.PHONY: build

image = logstash

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=90 dgoss run $(image)"

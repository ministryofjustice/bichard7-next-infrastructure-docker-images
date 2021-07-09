.PHONY: build

image = nginx-nodejs-supervisord

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run $(image)"

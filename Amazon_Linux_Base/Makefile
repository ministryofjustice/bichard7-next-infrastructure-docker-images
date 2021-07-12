.PHONY: build

image = amazon-linux2-base

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run $(image)"

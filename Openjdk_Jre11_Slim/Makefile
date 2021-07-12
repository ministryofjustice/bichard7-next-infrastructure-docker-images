.PHONY: build

image = openjdk-jre11-slim

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run $(image)"

.PHONY: build

image = prometheus

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run -e RETENTION_DAYS=1  -e HTPASSWD=test -e ARN_PREFIX='' -e CJSE_USE_SMTP_SERVICE=true $(image)"

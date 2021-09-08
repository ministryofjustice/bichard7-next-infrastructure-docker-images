.PHONY: build

image = nginx-supervisord

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run -e CJSE_NGINX_USERSERVICE_DOMAIN="localhost/elb-status" -e CJSE_NGINX_APP_DOMAIN="localhost/elb-status" $(image)"

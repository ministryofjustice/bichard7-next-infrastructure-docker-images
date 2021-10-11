.PHONY: build

image = nginx-auth-proxy

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run \
			-e CJSE_NGINX_USERSERVICE_DOMAIN="localhost/elb-status" \
			-e CJSE_NGINX_AUDITLOGGING_DOMAIN="localhost/elb-status" \
			-e CJSE_NGINX_APP_DOMAIN="localhost/elb-status" \
			-e CJSE_NGINX_PROXYSSLVERIFY="off" \
			$(image)"

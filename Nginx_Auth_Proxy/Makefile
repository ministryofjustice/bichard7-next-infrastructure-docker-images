image = nginx-auth-proxy

.PHONY: build-and-test
build-and-test: build unit-test-nginx goss

.PHONY: build-and-test-no-goss
build-and-test-no-goss: build unit-test-nginx

.PHONY: build-and-run
build-and-run: build run-test-nginx
	
.PHONY: build
build:
	docker build -t "$(image)" .

.PHONY: goss
goss:
	bash -c "GOSS_SLEEP=15 dgoss run \
			-e CJSE_NGINX_USERSERVICE_DOMAIN="localhost/elb-status" \
			-e CJSE_NGINX_AUDITLOGGING_DOMAIN="localhost/elb-status" \
			-e CJSE_NGINX_APP_DOMAIN="localhost/elb-status" \
			-e CJSE_NGINX_STATICSERVICE_DOMAIN="localhost/elb-status" \
			-e CJSE_NGINX_PROXYSSLVERIFY="off" \
			$(image)"

.PHONY: run-test-nginx
run-test-nginx:
	docker run -e CJSE_NGINX_APP_DOMAIN=172.17.0.1:60001 \
		-e CJSE_NGINX_USERSERVICE_DOMAIN=172.17.0.1:60002 \
		-e CJSE_NGINX_AUDITLOGGING_DOMAIN=172.17.0.1:60003 \
		-e CJSE_NGINX_STATICSERVICE_DOMAIN=172.17.0.1:60004 \
		-e CJSE_NGINX_PROXYSSLVERIFY="off" \
		-p 6443:443 -d \
		-p 8080:80 -d \
		--name test-nginx-server \
		$(image)

.PHONY: build-test
build-test:
	docker build -t nginx-auth-test ./test

.PHONY: wait-for-nginx
wait-for-nginx:
	bash ./scripts/wait-for-nginx.sh

.PHONY: unit-test-nginx
unit-test-nginx: build-test run-test-nginx wait-for-nginx
	docker run --rm --name nginx-auth-test -p 60001:60001 -p 60002:60002 -p 60003:60003 -p 60004:60004 -e TEST_HOSTS=https://172.17.0.1:6443,http://172.17.0.1:8080 nginx-auth-test
	docker rm -f test-nginx-server


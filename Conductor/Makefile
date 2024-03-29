SHELL := /bin/bash # Use bash syntax
image = conductor
skip_goss = ${SKIP_GOSS}

.PHONY: build
build: build-conductor goss

.PHONY: build-conductor
build-conductor:
	bash ./build.sh conductor

.PHONY: clean
clean:
	rm -rf conductor

.PHONY: goss
goss:
ifeq ($(skip_goss),true)
	echo "Skipping goss tests"
else
	docker rm -f goss-localstack || true
	docker rm -f goss-postgres || true
	docker network rm -f goss-net || true
	docker network create goss-net
	docker run --net goss-net --name goss-localstack -e SERVICES=s3,sqs,dynamodb -e AWS_DEFAULT_REGION=eu-west-2 -d localstack/localstack
	docker run --net goss-net --name goss-postgres -e POSTGRES_PASSWORD=password -d postgres
	dgoss run \
		--net goss-net \
		-e CJSE_CONDUCTOR_UI_USERNAME=bichard \
		-e CJSE_CONDUCTOR_UI_PASSWORD=password \
    -e CJSE_CONDUCTOR_ENABLE_HTTP=true \
		-e SPRING_DATASOURCE_URL=jdbc:postgresql://goss-postgres:5432/postgres \
		-e SPRING_DATASOURCE_USERNAME=postgres \
		-e SPRING_DATASOURCE_PASSWORD=password \
		-e AWS_ACCESS_KEY_ID=FAKE \
		-e AWS_REGION=eu-west-2 \
		-e AWS_SECRET_ACCESS_KEY=FAKE \
    -e CONDUCTOR_EVENTQUEUES_SQS_ENDPOINT=http://goss-localstack:4566 \
		$(image) 
	docker rm -f goss-localstack || true
	docker rm -f goss-postgres || true
	docker network rm -f goss-net || true
endif

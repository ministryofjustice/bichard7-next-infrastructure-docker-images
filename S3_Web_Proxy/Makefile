.PHONY: build

image = s3-web-portal

build:
	docker build -t "$(image)" .
	bash -c "GOSS_SLEEP=15 dgoss run -e AWS_ACCESS_KEY_ID='' -e AWS_SECRET_ACCESS_KEY='' -e S3_BUCKET_NAME='dummy' -e HTPASSWD=test $(image)"

.PHONY: build-linux-base build-nodejs build-openjdk
build-linux-base:
	cd Amazon_Linux_Base && docker build . -t amazon-linux2-base

build-nodejs:
	cd NodeJS && docker build . -t nodejs

build-openjdk:
	cd Openjdk_Jre11_Slim && docker build . -t openjdk-jre11-slim

.PHONY: build-base
build-base: build-linux-base build-openjdk build-nodejs

.PHONY: build-java-nginx build-nodejs-nginx
build-java-nginx:
	cd Nginx_Java_Supervisord && docker build . -t nginx-java-supervisord

build-nodejs-nginx:
	cd Nginx_NodeJS_Supervisord && docker build . -t nginx-nodejs-supervisord

.PHONY: build-nginx-base
build-nginx-base: build-java-nginx build-nodejs-nginx

.PHONY: build-prometheus build-grafana build-prometheus-cloudwatch-exporter
build-grafana:
	cd Grafana && docker build . -t grafana

build-prometheus:
	cd Prometheus && docker build . -t prometheus

build-prometheus-cloudwatch-exporter:
	cd Prometheus_Cloudwatch_Exporter && docker build . -t prometheus-cloudwatch-exporter

.PHONY: build-monitoring
build-monitoring: build-grafana build-prometheus build-prometheus-cloudwatch-exporter

.PHONY: build-scanning-results-portal
build-scanning-results-portal:
	cd Scanning_Results_Portal && docker build . -t nginx-scanning-portal

# Scanning results portal is excluded as we only use it on Path to Live
.PHONY: build-all
build-all: build-base build-nginx-base build-monitoring

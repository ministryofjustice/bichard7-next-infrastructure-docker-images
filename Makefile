BASE_CONTAINERS:= Amazon_Linux_Base Openjdk_Jre11_Slim NodeJS Postfix Codebuild_Base
NGINX_CONTAINERS:= Nginx_NodeJS_Supervisord Nginx_Supervisord Nginx_Auth_Proxy Nginx_Java_Supervisord S3_Web_Proxy Scanning_Results_Portal
MONITORING_CONTAINERS:= Grafana Grafana_Codebuild Prometheus Prometheus_Cloudwatch_Exporter Logstash Prometheus_BlackBox_Exporter

.PHONY: $(BASE_CONTAINERS) $(NGINX_CONTAINERS) $(MONITORING_CONTAINERS) build-scanning-results-portal

build-base: $(BASE_CONTAINERS)
build-nginx: $(NGINX_CONTAINERS)
build-monitoring: $(MONITORING_CONTAINERS)

build-scanning-results-portal:
	cd Scanning_Results_Portal && docker build . -t nginx-scanning-portal

build-all: build-base build-nginx build-monitoring

#
# Base containers
#

$(BASE_CONTAINERS):
	$(MAKE) -C $@

Codebuild_Base Openjdk_Jre11_Slim NodeJS Postfix: Amazon_Linux_Base

#
# Nginx containers
#

Nginx_Supervisord Nginx_Java_Supervisord Nginx_NodeJS_Supervisord Nginx_Auth_Proxy:
	$(MAKE) -C $@

Scanning_Results_Portal: Nginx_NodeJS_Supervisord
	cd Scanning_Results_Portal && docker build . -t nginx-scanning-portal

Nginx_Supervisord: Amazon_Linux_Base
Nginx_Java_Supervisord: Openjdk_Jre11_Slim
Nginx_NodeJS_Supervisord: NodeJS
Nginx_Auth_Proxy: Nginx_Supervisord NodeJS

#
# Monitoring containers
#

$(MONITORING_CONTAINERS):
	$(MAKE) -C $@

Grafana_Codebuild Grafana Logstash: Amazon_Linux_Base
Prometheus Prometheus_Cloudwatch_Exporter Prometheus_BlackBox_Exporter: Nginx_Java_Supervisord

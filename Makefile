BASE_CONTAINERS:= Amazon_Linux_Base Openjdk_Jre11_Slim NodeJS Postfix Codebuild_Base Amazon_Linux_2023_Base NodeJS_2023
NGINX_CONTAINERS:= Nginx_NodeJS_Supervisord Nginx_Supervisord Nginx_Auth_Proxy Nginx_Java_Supervisord S3_Web_Proxy Scanning_Results_Portal Conductor Nginx_NodeJS_2023_Supervisord
MONITORING_CONTAINERS:= Grafana Grafana_Codebuild Prometheus Prometheus_Cloudwatch_Exporter Logstash Prometheus_BlackBox_Exporter

.PHONY: $(BASE_CONTAINERS) $(NGINX_CONTAINERS) $(MONITORING_CONTAINERS)

build-base: $(BASE_CONTAINERS)
build-nginx: $(NGINX_CONTAINERS)
build-monitoring: $(MONITORING_CONTAINERS)

build-all: build-base build-nginx build-monitoring

# Only build the containers normally used to run the Bichard stack locally
build-local: Nginx_Auth_Proxy Conductor Nginx_NodeJS_Supervisord

#
# Base containers
#

$(BASE_CONTAINERS):
	$(MAKE) -C $@

Codebuild_Base Openjdk_Jre11_Slim NodeJS Postfix: Amazon_Linux_Base

#
# Nginx containers
#

$(NGINX_CONTAINERS):
	$(MAKE) -C $@

Scanning_Results_Portal: Nginx_NodeJS_Supervisord
Nginx_Supervisord: Amazon_Linux_Base
Nginx_Java_Supervisord: Openjdk_Jre11_Slim
Nginx_NodeJS_Supervisord: NodeJS
Nginx_Auth_Proxy: Nginx_Supervisord NodeJS
Conductor: Nginx_Java_Supervisord
NodeJS: Amazon_Linux_Base
NodeJS_2023: Amazon_Linux_2023_Base

#
# Monitoring containers
#

$(MONITORING_CONTAINERS):
	$(MAKE) -C $@

Grafana_Codebuild Grafana Logstash: Amazon_Linux_Base
Prometheus Prometheus_Cloudwatch_Exporter Prometheus_BlackBox_Exporter: Nginx_Java_Supervisord

BASE_CONTAINERS:= Amazon_Linux_Base Openjdk_Jre11_Slim NodeJS Postfix Codebuild_Base Amazon_Linux_2023_Base NodeJS_2023
NGINX_CONTAINERS:= Nginx_NodeJS_Supervisord Nginx_Supervisord Nginx_Auth_Proxy Nginx_Java_Supervisord S3_Web_Proxy Scanning_Results_Portal Conductor Nginx_NodeJS_2023_Supervisord Nginx_NodeJS_20_2023_Supervisord
MONITORING_CONTAINERS:= Grafana Prometheus Prometheus_Cloudwatch_Exporter Prometheus_BlackBox_Exporter

AL2_IMAGES:= Grafana Nginx_Auth_Proxy Codebuild_Base S3_Web_Proxy Scanning_Results_Portal Prometheus Prometheus_BlackBox_Exporter Prometheus_Cloudwatch_Exporter
AL2023_IMAGES:= Nginx_NodeJS_2023_Supervisord Nginx_NodeJS_20_2023_Supervisord NodeJS_2023

.PHONY: $(BASE_CONTAINERS) $(NGINX_CONTAINERS) $(MONITORING_CONTAINERS)

build-base: $(BASE_CONTAINERS)
build-nginx: $(NGINX_CONTAINERS)
build-monitoring: $(MONITORING_CONTAINERS)
build-al2: $(AL2_IMAGES)
build-al2023: $(AL2023_IMAGES)

build-all: build-base build-nginx build-monitoring

# Only build the containers normally used to run the Bichard stack locally
build-local: Nginx_Auth_Proxy Conductor Nginx_NodeJS_20_2023_Supervisord

#
# Base containers
#

$(BASE_CONTAINERS):
	$(MAKE) -C $@

#
# Nginx containers
#

$(NGINX_CONTAINERS):
	$(MAKE) -C $@

Grafana Nginx_Supervisord NodeJS Openjdk_Jre11_Slim Postfix: Amazon_Linux_Base
Prometheus Prometheus_Cloudwatch_Exporter Prometheus_BlackBox_Exporter: Nginx_Java_Supervisord
Codebuild_Base: NodeJS
Scanning_Results_Portal S3_Web_Proxy: Nginx_NodeJS_Supervisord
Nginx_Java_Supervisord: Openjdk_Jre11_Slim
Nginx_NodeJS_Supervisord: NodeJS
Nginx_Auth_Proxy: Nginx_Supervisord NodeJS
NodeJS_2023 Conductor: Amazon_Linux_2023_Base
Nginx_NodeJS_2023_Supervisord: NodeJS_2023

#
# Monitoring containers
#

$(MONITORING_CONTAINERS):
	$(MAKE) -C $@

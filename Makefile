BASE_CONTAINERS:= Amazon_Linux_Base Openjdk_Jre11_Slim NodeJS
NGINX_CONTAINERS:= Nginx_NodeJS_Supervisord Nginx_Supervisord Nginx_Auth_Proxy Nginx_Java_Supervisord S3_Web_Proxy Scanning_Results_Portal
MONITORING_CONTAINERS:= Grafana Prometheus Prometheus_Cloudwatch_Exporter Logstash Prometheus_BlackBox_Exporter

.PHONY: $(BASE_CONTAINERS) $(NGINX_CONTAINERS) $(MONITORING_CONTAINERS) build-scanning-results-portal

build-base: $(BASE_CONTAINERS)
build-nginx: $(NGINX_CONTAINERS)
build-monitoring: $(MONITORING_CONTAINERS)

build-scanning-results-portal:
	cd Scanning_Results_Portal && docker build . -t nginx-scanning-portal

build-all: build-base build-nginx build-monitoring

$(BASE_CONTAINERS):
	$(MAKE) -C $@

$(NGINX_CONTAINERS):
	$(MAKE) -C $@

$(MONITORING_CONTAINERS):
	$(MAKE) -C $@

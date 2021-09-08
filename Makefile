BASE_CONTAINERS:= Amazon_Linux_Base Openjdk_Jre11_Slim NodeJS
NGINX_CONTAINERS:= Nginx_Java_Supervisord Nginx_NodeJS_Supervisord Nginx_Supervisord
MONITORING_CONTAINERS:= Grafana Prometheus Prometheus_Cloudwatch_Exporter Logstash Prometheus_BlackBox_Exporter

.PHONY: $(BASE_CONTAINERS) $(MONITORING_CONTAINERS) $(NGINX_CONTAINERS) build-scanning-results-portal

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

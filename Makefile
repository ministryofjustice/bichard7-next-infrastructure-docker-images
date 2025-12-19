BASE_CONTAINERS:= Amazon_Linux_Base NodeJS_20_2023 Postfix Codebuild_Base Codebuild_2023_Base Amazon_Linux_2023_Base NodeJS_24_2023
NGINX_CONTAINERS:= Nginx_Supervisord Nginx_Auth_Proxy Nginx_Java_Supervisord S3_Web_Proxy S3_Web_Proxy_Node_24 Conductor Nginx_NodeJS_24_2023_Supervisord Nginx_NodeJS_20_2023_Supervisord

AL2_IMAGES:= Codebuild_Base
AL2023_IMAGES:= Codebuild_2023_Base Nginx_NodeJS_20_2023_Supervisord Nginx_NodeJS_24_2023_Supervisord NodeJS_24_2023 NodeJS_20_2023 S3_Web_Proxy Nginx_Auth_Proxy

.PHONY: $(BASE_CONTAINERS) $(NGINX_CONTAINERS)

build-base: $(BASE_CONTAINERS)
build-nginx: $(NGINX_CONTAINERS)
build-al2: $(AL2_IMAGES)
build-al2023: $(AL2023_IMAGES)

build-all: build-base build-nginx

# Only build the containers normally used to run the Bichard stack locally
build-local: Nginx_Auth_Proxy Conductor Nginx_NodeJS_24_2023_Supervisord Nginx_NodeJS_20_2023_Supervisord

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

NodeJS: Amazon_Linux_Base
S3_Web_Proxy: Nginx_NodeJS_24_2023_Supervisord
S3_Web_Proxy_Node_24: Nginx_NodeJS_24_2023_Supervisord
NodeJS_20_2023 Conductor Postfix: Amazon_Linux_2023_Base
NodeJS_24_2023 Conductor Postfix: Amazon_Linux_2023_Base
Nginx_Auth_Proxy: Amazon_Linux_2023_Base NodeJS_24_2023 NodeJS_20_2023
Nginx_NodeJS_24_2023_Supervisord: NodeJS_24_2023

#! /bin/bash

# All variables used in templates need a default provided here
export CJSE_NGINX_DNS_RESOLVER=${CJSE_NGINX_DNS_RESOLVER:-127.0.0.11}
export CJSE_NGINX_PORT_HTTP=${CJSE_NGINX_PORT_HTTP:-80}
export CJSE_NGINX_PORT_HTTPS=${CJSE_NGINX_PORT_HTTPS:-443}
export CJSE_NGINX_PROXYSSLVERIFY=${CJSE_NGINX_PROXYSSLVERIFY:-on}

export VARIABLES='$CJSE_NGINX_DNS_RESOLVER \
$CJSE_NGINX_PORT_HTTP \
$CJSE_NGINX_PORT_HTTPS \
$CJSE_NGINX_APP_DOMAIN \
$CJSE_NGINX_BICHARDBACKEND_DOMAIN \
$CJSE_NGINX_USERSERVICE_DOMAIN \
$CJSE_NGINX_UI_DOMAIN \
$CJSE_NGINX_STATICSERVICE_DOMAIN
$CJSE_NGINX_PROXYSSLVERIFY'

envsubst '$CJSE_NGINX_DNS_RESOLVER \
$CJSE_NGINX_PORT_HTTP \
$CJSE_NGINX_PORT_HTTPS \
$CJSE_NGINX_APP_DOMAIN \
$CJSE_NGINX_BICHARDBACKEND_DOMAIN \
$CJSE_NGINX_USERSERVICE_DOMAIN \
$CJSE_NGINX_UI_DOMAIN \
$CJSE_NGINX_STATICSERVICE_DOMAIN
$CJSE_NGINX_PROXYSSLVERIFY' < /etc/templates/bichard.https.conf.tpl > /etc/nginx/includes/bichard.https.conf

envsubst '$CJSE_NGINX_DNS_RESOLVER \
$CJSE_NGINX_PORT_HTTP \
$CJSE_NGINX_PORT_HTTPS \
$CJSE_NGINX_APP_DOMAIN \
$CJSE_NGINX_BICHARDBACKEND_DOMAIN \
$CJSE_NGINX_USERSERVICE_DOMAIN \
$CJSE_NGINX_UI_DOMAIN \
$CJSE_NGINX_STATICSERVICE_DOMAIN
$CJSE_NGINX_PROXYSSLVERIFY' < /etc/templates/bichard.http.conf.tpl > /etc/nginx/includes/bichard.http.conf

envsubst '$CJSE_NGINX_PORT_HTTP \
$CJSE_NGINX_PORT_HTTPS' < /etc/templates/nginx.conf.tpl > /etc/nginx/nginx.conf

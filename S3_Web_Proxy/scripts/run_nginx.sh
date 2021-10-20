#!/usr/bin/env bash

htpasswd -bc /nginx_auth/.htpasswd bichard ${HTPASSWD}
/usr/sbin/nginx -g "daemon off;"

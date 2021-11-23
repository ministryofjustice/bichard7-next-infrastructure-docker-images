user nginx;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
}

http {
    sendfile                  on;
    tcp_nopush                on;
    tcp_nodelay               on;
    keepalive_timeout         65;
    types_hash_max_size       2048;
    include                   /etc/nginx/mime.types;
    default_type              application/octet-stream;
    ssl_protocols             TLSv1.2; # Dropping SSLv3, ref: POODLE
    ssl_prefer_server_ciphers on;
    error_log                 /dev/stderr;
    access_log                /dev/stdout combined;
    gzip                      on;
    include                   /etc/nginx/conf.d/*.conf;
    include                   /etc/nginx/sites-enabled/*;
    server_tokens             off;

    log_format json escape=json '{'
        '"@timestamp": "$time_iso8601", '
        '"message": "$remote_addr - $remote_user [$time_local] \\\"$request\\\" $status $body_bytes_sent \\\"$http_referer\\\" \\\"$http_user_agent\\\"", '
        '"tags": ["nginx_access"], '
        '"realip": ""$remote_addr", '
        '"proxyip": "$http_x_forwarded_for", '
        '"remote_user": "$remote_user", '
        '"contenttype": "$sent_http_content_type", '
        '"bytes": $body_bytes_sent, '
        '"duration": "$request_time", '
        '"status": "$status", '
        '"request": "$request", '
        '"method": "$request_method", '
        '"referrer": "$http_referer", '
        '"useragent": "$http_user_agent"'
    '}';

    server {
        listen                          {{ atoi (getv "/cjse/nginx/port/https" "443") }} ssl;
        ssl_certificate                 /certs/server.crt;
        ssl_certificate_key             /certs/server.key;
        ssl_protocols                   TLSv1.2;
        ssl_ciphers                     HIGH:!aNULL:!MD5;

        access_log                      /dev/stdout json;

        proxy_cookie_path               / "/; HTTPOnly; Secure";
        proxy_hide_header               Content-Security-Policy;
        proxy_ssl_trusted_certificate   /etc/ssl/certs/ca-bundle.crt;

        resolver {{ getv "/cjse/nginx/dns/resolver" "127.0.0.11" }};
        set $app "{{ getv "/cjse/nginx/app/domain" }}";
        set $userservice "{{ getv "/cjse/nginx/userservice/domain" }}";
        set $auditlogging "{{ getv "/cjse/nginx/auditlogging/domain" }}";
        set $staticservice "{{ getv "/cjse/nginx/staticservice/domain" }}";


        # Redirect any unauthenticated users to the login page
        error_page 401 = @error401;
        location @error401 {
            limit_except      GET POST PUT { deny all; }
            include /etc/includes/without-auth-headers.conf;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
            return 302 /users/login?redirect=$request_uri;
        }

        # Display error page for 403, 404 and 500 errors
        error_page 403 =403 /403;
        error_page 404 =404 /404;
        error_page 500 =500 /500;
        location ~ ^/(403|404|500)$ {
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            limit_except      GET POST PUT { deny all; }
            include /etc/includes/without-auth-headers.conf;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
            rewrite /(.*) /users/$1;
        }

        # Use API endpoint in user-service for checking authentication
        location /auth {
            limit_except      GET POST PUT { deny all; }
            include /etc/includes/without-auth-headers.conf;

            proxy_pass        https://$userservice/users/api/auth;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

            proxy_pass_request_body  off;
            proxy_set_header  Content-Length '0';
            proxy_set_header  Referer $request_uri;
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
        }

        # Proxy for landing page to Bichard
        location = / {
            limit_except GET POST PUT DELETE { deny all; }
            include /etc/includes/with-auth-headers.conf;
            return 302 /users;
        }

        # Proxy through to Bichard
        location /bichard-ui {
            limit_except GET POST PUT DELETE { deny all; }
            auth_request /auth;
            auth_request_set $auth_cookie $upstream_http_set_cookie;
            include /etc/includes/with-auth-headers.conf;
            add_header Set-Cookie $auth_cookie;

            proxy_pass        https://$app;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_set_header Host $http_host;

            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_intercept_errors on;
        }

        # Proxy through to audit-logging
        location /audit-logging {
            limit_except GET POST PUT DELETE { deny all; }
            auth_request /auth;
            auth_request_set $auth_cookie $upstream_http_set_cookie;
            include /etc/includes/audit-logging-headers.conf;
            add_header Set-Cookie $auth_cookie;

            proxy_pass        https://$auditlogging;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_set_header Host $host;

            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
            proxy_intercept_errors on;
        }

        # Proxy through to user-service
        location /users {
            limit_except GET POST PUT DELETE { deny all; }
            auth_request /auth;
            auth_request_set $auth_cookie $upstream_http_set_cookie;
            include /etc/includes/with-auth-headers.conf;
            add_header Set-Cookie $auth_cookie;

            proxy_pass        https://$userservice;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_set_header Host $host;

            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
            proxy_intercept_errors on;
        }

        # Proxy through to report downloads
        location /reports {
            limit_except GET { deny all; }
            auth_request /auth;
            auth_request_set $auth_cookie $upstream_http_set_cookie;
            include /etc/includes/with-auth-headers.conf;
            add_header Set-Cookie $auth_cookie;

            proxy_pass        https://$staticservice;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_set_header Host $host;

            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_intercept_errors on;
        }

        # Proxy through to help files without auth
        location /help {
            limit_except GET { deny all; }
            include /etc/includes/without-auth-headers.conf;

            proxy_pass        https://$staticservice;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_set_header Host $host;

            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_intercept_errors on;
        }

        # Allow access to user-service login flow (and necessary assets) without authentication
        location ~ ^/users/(login|assets|_next/static|403|404|500)(.*)$ {
            limit_except GET POST PUT { deny all; }
            include /etc/includes/without-auth-headers.conf;

            proxy_pass        https://$userservice;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
        }

        # Allow access to bichard-ui health check, connectivity and static endpoints without authentication
        location ~ ^/bichard-ui/(Health|Connectivity|images|css).*$ {
            include /etc/includes/without-auth-headers.conf;
            proxy_pass        https://$app;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_cookie_flags ~ httponly secure samesite=strict;
        }

        # Healthcheck endpoint
        location /elb-status {
            limit_except GET POST { deny all; }
            include /etc/includes/without-auth-headers.conf;
            access_log   off;
            return       200;
            add_header   Content-Type text/plain;
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
        }
    }

    server {
      listen        {{ atoi (getv "/cjse/nginx/port/http" "80") }} default_server;
      server_name   _;
      return        301 https://$host$request_uri;
    }
}

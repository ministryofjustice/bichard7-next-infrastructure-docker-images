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
    error_log                 /dev/stdout info;
    access_log                /dev/stdout combined;
    gzip                      on;
    include                   /etc/nginx/conf.d/*.conf;
    include                   /etc/nginx/sites-enabled/*;
    server_tokens             off;

    server {
        listen                          {{ atoi (getv "/cjse/nginx/port/https" "443") }} ssl;
        ssl_certificate                 /certs/server.crt;
        ssl_certificate_key             /certs/server.key;
        ssl_protocols                   TLSv1.2;
        ssl_ciphers                     HIGH:!aNULL:!MD5;
        add_header                      Set-Cookie "Path=/; HttpOnly; Secure; SameSite=strict";
        add_header                      Cache-Control "no-store, no-cache, must-revalidate";
        add_header                      Content-Security-Policy "default-src 'self'; frame-src 'self'; frame-ancestors 'self'; form-action 'self';" always;
        add_header                      X-XSS-Protection "1; mode=block";
        add_header                      Referrer-Policy "origin";

        proxy_hide_header               Content-Security-Policy;

        proxy_ssl_trusted_certificate   /etc/ssl/certs/ca-bundle.crt;

        resolver {{ getv "/cjse/nginx/dns/resolver" "127.0.0.11" }};
        set $app "{{ getv "/cjse/nginx/app/domain" }}";
        set $userservice "{{ getv "/cjse/nginx/userservice/domain" }}";
        set $auditlogging "{{ getv "/cjse/nginx/auditlogging/domain" }}";
        set $reportservice "{{ getv "/cjse/nginx/reportservice/domain" }}";


        # Redirect any unauthenticated users to the login page
        error_page 401 = @error401;
        location @error401 {
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
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
            rewrite /(.*) /users/$1;
        }

        # Use API endpoint in user-service for checking authentication
        location /auth {
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
            return 302 /users;
        }

        # Proxy through to Bichard
        location /bichard-ui {
            auth_request /auth;
            auth_request_set $auth_cookie $upstream_http_set_cookie;
            add_header Set-Cookie $auth_cookie;

            proxy_pass        https://$app;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

            limit_except GET POST PUT DELETE { deny all; }
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_intercept_errors on;
        }

        # Proxy through to audit-logging
        location /audit-logging {
            auth_request /auth;
            auth_request_set $auth_cookie $upstream_http_set_cookie;
            add_header Set-Cookie $auth_cookie;

            proxy_pass        https://$auditlogging;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

            limit_except GET POST PUT DELETE { deny all; }
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
            proxy_intercept_errors on;
        }

        # Proxy through to user-service
        location /users {
            auth_request /auth;
            auth_request_set $auth_cookie $upstream_http_set_cookie;
            add_header Set-Cookie $auth_cookie;

            proxy_pass        https://$userservice;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

            limit_except GET POST PUT DELETE { deny all; }
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
            proxy_intercept_errors on;
        }

        # Proxy through to report downloads
        location /reports {
            error_page 401 = @error401;
            error_page 403 = @error403;
            auth_request /auth;
            auth_request_set $auth_cookie $upstream_http_set_cookie;
            add_header Set-Cookie $auth_cookie;

            rewrite /reports/(.*) /$1  break;
            proxy_pass        https://$reportservice;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

            limit_except GET { deny all; }
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_intercept_errors on;
        }

        # Allow access to user-service login flow (and necessary assets) without authentication
        location ~ ^/users/(login|assets|_next/static|access-denied|403|404|500)(.*)$ {
            proxy_pass        https://$userservice;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;

        }

        # Allow access to bichard-ui health check, connectivity and static endpoints without authentication
        location ~ ^/bichard-ui/(Health|Connectivity|images|css).*$ {
            proxy_pass        https://$app;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
            proxy_cookie_flags ~ httponly secure samesite=strict;
        }

        # Healthcheck endpoint
        location /elb-status {
            access_log   off;
            return       200;
            add_header   Content-Type text/plain;
            limit_except GET POST { deny all; }
            proxy_cookie_flags ~ httponly secure samesite=strict;
            proxy_ssl_server_name on;
            proxy_ssl_verify_depth 2;
        }
    }

    server {
      listen        {{ atoi (getv "/cjse/nginx/port/http" "80") }} default_server;
      server_name   _;
      return        301 https://$host$request_uri;
      error_log     /dev/stdout info;
      access_log    /dev/stdout combined;
    }
}

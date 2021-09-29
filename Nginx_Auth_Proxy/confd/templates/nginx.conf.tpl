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
        listen                          443   ssl;
        ssl_certificate                 /certs/server.crt;
        ssl_certificate_key             /certs/server.key;
        ssl_protocols                   TLSv1.2;
        ssl_ciphers                     HIGH:!aNULL:!MD5;
        add_header                      Strict-Transport-Security "max-age=31536000; includeSubDomains";

        proxy_ssl_trusted_certificate   /etc/ssl/certs/ca-bundle.crt;

        # Redirect any unauthorised users to the login page
        location @error401 {
            return 302 https://$host/users/login?redirect=https://$host$request_uri;
        }

        # Use API endpoint in user-service for checking authentication
        location /auth {
            proxy_pass        https://{{ getv "/cjse/nginx/userservice/domain" }}/users/api/auth;
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

            proxy_pass_request_body  off;
            proxy_set_header  Content-Length '0';
        }

        # Proxy through to Bichard
        location / {
            error_page 401 = @error401;
            auth_request /auth;

            proxy_pass        https://{{ getv "/cjse/nginx/app/domain" }};
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

            limit_except GET POST PUT DELETE { deny all; }
        }

        # Proxy through to user-service
        location /users {
            error_page 401 = @error401;
            auth_request /auth;

            proxy_pass        https://{{ getv "/cjse/nginx/userservice/domain" }};
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

            limit_except GET POST PUT DELETE { deny all; }
        }

        # Allow access to user-service login flow (and necessary assets) without authentication
        location ~ ^/users/(login|assets|_next/static)(.*)$ {
            proxy_pass        https://{{ getv "/cjse/nginx/userservice/domain" }};
            proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
        }

        # Healthcheck endpoint
        location /elb-status {
            access_log   off;
            return       200;
            add_header   Content-Type text/plain;
            limit_except GET POST { deny all; }
        }
    }

    server {
      listen        80 default_server;
      server_name   _;
      return        301 https://$host$request_uri;
      error_log     /dev/stdout info;
      access_log    /dev/stdout combined;
    }
}

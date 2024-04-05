user nginx;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 1000;
}

http {
    sendfile                  on;
    tcp_nopush                on;
    tcp_nodelay               on;
    keepalive_timeout         500;
    types_hash_max_size       2048;
    client_max_body_size      100m;
    include                   /etc/nginx/mime.types;
    default_type              application/octet-stream;
    ssl_protocols             TLSv1.2; # Dropping SSLv3, ref: POODLE
    ssl_prefer_server_ciphers on;
    error_log                 off;
    access_log                off;
    gzip                      on;
    include                   /etc/nginx/conf.d/*.conf;
    include                   /etc/nginx/sites-enabled/*;
    server_tokens             off;

    server {
      listen                5000   ssl;
      ssl_certificate       /certs/server.crt;
      ssl_certificate_key   /certs/server.key;
      ssl_protocols         TLSv1.2;
      ssl_ciphers           HIGH:!aNULL:!MD5;

      auth_basic           "Administrator’s Area";
      auth_basic_user_file /.htpasswd;

      resolver {{ getv "/cjse/nginx/dns/resolver" "127.0.0.11" }};

      set $conductor "127.0.0.1:8080";

      location / {
        root /usr/share/nginx/html;
        try_files $uri /index.html;
      }

      location ~ ^/api(.*)$ {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-NginX-Proxy true;
        proxy_pass http://$conductor;
        proxy_ssl_session_reuse off;
        proxy_set_header Host $http_host;
        proxy_cache_bypass $http_upgrade;
        proxy_redirect off;
      }

      location ~ ^/metrics$ {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-NginX-Proxy true;
        proxy_pass http://$conductor/actuator/prometheus;
        proxy_ssl_session_reuse off;
        proxy_set_header Host $http_host;
        proxy_cache_bypass $http_upgrade;
        proxy_redirect off;
        auth_basic off;
      }

      location ~ ^/health(.*)$ {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-NginX-Proxy true;
        proxy_pass http://$conductor;
        proxy_ssl_session_reuse off;
        proxy_set_header Host $http_host;
        proxy_cache_bypass $http_upgrade;
        proxy_redirect off;
        auth_basic off;
      }
    }

    {{ with getv "/cjse/conductor/enable/http" "false" }}
    {{ if eq . "true" }}
    server {
        listen                4000;

        auth_basic           "Administrator’s Area";
        auth_basic_user_file /.htpasswd;

        resolver {{ getv "/cjse/nginx/dns/resolver" "127.0.0.11" }};

        set $conductor "127.0.0.1:8080";

        location / {
            root /usr/share/nginx/html;
            try_files $uri /index.html;
        }

        location ~ ^/(api|health|swagger-ui)(.*)$ {
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass http://$conductor;
            proxy_redirect off;
        }
    }
    {{ end }}
    {{ end }}
}

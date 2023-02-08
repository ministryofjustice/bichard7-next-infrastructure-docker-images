user nginx;
worker_processes auto;
pid /run/nginx.pid;
daemon off;
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
        '"realip": "$remote_addr", '
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
        listen                5000   ssl;
        ssl_certificate       /certs/server.crt;
        ssl_certificate_key   /certs/server.key;
        ssl_protocols         TLSv1.2;
        ssl_ciphers           HIGH:!aNULL:!MD5;
        access_log            /dev/stdout json;

      auth_basic           "Administrator’s Area";
      auth_basic_user_file /.htpasswd;

      location / {
        root /usr/share/nginx/html;
        try_files $uri /index.html;
      }

      location ~ ^/api(.*)$ {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-NginX-Proxy true;
        proxy_pass http://localhost:8080;
        proxy_ssl_session_reuse off;
        proxy_set_header Host $http_host;
        proxy_cache_bypass $http_upgrade;
        proxy_redirect off;
      }

      location ~ ^/health(.*)$ {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-NginX-Proxy true;
        proxy_pass http://localhost:8080;
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
        access_log            /dev/stdout json;

        auth_basic           "Administrator’s Area";
        auth_basic_user_file /.htpasswd;

        location / {
            root /usr/share/nginx/html;
            try_files $uri /index.html;
        }

        location ~ ^/(api|health|swagger-ui)(.*)$ {
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass http://localhost:8080;
            proxy_redirect off;
        }
    }
    {{ end }}
    {{ end }}
}

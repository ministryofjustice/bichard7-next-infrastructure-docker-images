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

{{ if not ( exists "/cjse/nginx/hosts/1/name" )}}
    server {
        listen                          {{ atoi (getv "/cjse/nginx/port/https" "443") }} ssl;
        ssl_certificate                 /certs/server.crt;
        ssl_certificate_key             /certs/server.key;

        include /etc/includes/bichard.https.conf;
    }
{{ end }}

{{range $dir := lsdir "/cjse/nginx/hosts"}}
    {{$cert := printf "/cjse/nginx/hosts/%s/cert" $dir}}
    {{$name := printf "/cjse/nginx/hosts/%s/name" $dir}}
    server {
        listen                          {{ atoi (getv "/cjse/nginx/port/https" "443") }} ssl;
        ssl_certificate                 {{ getv $cert "/certs/server" }}.crt;
        ssl_certificate_key             {{ getv $cert "/certs/server" }}.key;

        server_name {{ getv $name "localhost" }}

        include /etc/includes/bichard.https.conf;
    }
{{end}}

    server {
        listen        {{ atoi (getv "/cjse/nginx/port/http" "80") }} default_server;
        server_name   _;

        include /etc/includes/bichard.http.conf;
    }
}

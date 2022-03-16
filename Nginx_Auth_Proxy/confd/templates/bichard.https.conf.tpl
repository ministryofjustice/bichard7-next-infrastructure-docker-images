ssl_protocols                   TLSv1.2;
ssl_ciphers                     HIGH:!aNULL:!MD5;

access_log                      /dev/stdout json;

proxy_hide_header               Content-Security-Policy;
proxy_ssl_trusted_certificate   /etc/ssl/certs/ca-bundle.crt;

resolver {{ getv "/cjse/nginx/dns/resolver" "127.0.0.11" }};
set $app "{{ getv "/cjse/nginx/app/domain" }}";
set $bichardbackend "{{ getv "/cjse/nginx/bichardbackend/domain" }}";
set $userservice "{{ getv "/cjse/nginx/userservice/domain" }}";
set $auditlogging "{{ getv "/cjse/nginx/auditlogging/domain" }}";
set $staticservice "{{ getv "/cjse/nginx/staticservice/domain" }}";


# Redirect any unauthenticated users to the login page
error_page 401 = @error401;
location @error401 {
    limit_except      GET POST PUT { deny all; }
    include /etc/includes/headers.conf;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    absolute_redirect off;
    return 302 /users/login?redirect=$request_uri;
}

# Display error page for 403, 404 and 500 errors
error_page 403 =403 /403;
error_page 404 =404 /404;
error_page 500 =500 /500;
location ~ ^/(403|404|500)$ {
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    limit_except      GET POST PUT { deny all; }
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    rewrite /(.*) /users/$1;
}

# Use API endpoint in user-service for checking authentication
location /auth {
    limit_except      GET POST PUT { deny all; }
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;

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
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;
    absolute_redirect off;
    return 302 /users;
}

# Proxy through to Bichard
location /bichard-ui {
    limit_except GET POST PUT DELETE { deny all; }
    auth_request /auth;
    auth_request_set $auth_cookie $upstream_http_set_cookie;
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;
    add_header Set-Cookie "$auth_cookie; secure";

    proxy_pass        https://$app;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $http_host;

    proxy_intercept_errors on;
}

# Proxy through to audit-logging
location /audit-logging {
    limit_except GET POST PUT DELETE { deny all; }
    auth_request /auth;
    auth_request_set $auth_cookie $upstream_http_set_cookie;
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/audit-logging-headers.conf;
    add_header Set-Cookie "$auth_cookie; secure";

    proxy_pass        https://$auditlogging;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $host;

    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    proxy_intercept_errors on;
}

# Proxy through to user-service
location /users {
    limit_except GET POST PUT DELETE { deny all; }
    auth_request /auth;
    auth_request_set $auth_cookie $upstream_http_set_cookie;
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;
    add_header Set-Cookie "$auth_cookie; secure";

    proxy_pass        https://$userservice;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $host;
    proxy_set_header X-Origin https://$host;

    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    proxy_intercept_errors on;
}

# Proxy through to report downloads
location /reports {
    limit_except GET { deny all; }
    auth_request /auth;
    auth_request_set $auth_cookie $upstream_http_set_cookie;
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;
    add_header Set-Cookie "$auth_cookie; secure";

    proxy_pass        https://$staticservice;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $host;

    proxy_intercept_errors on;
}

# Proxy through to help files without auth
location /help {
    limit_except GET { deny all; }
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;

    proxy_pass        https://$staticservice;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $host;

    proxy_cookie_flags ~ httponly secure samesite=strict;
    proxy_intercept_errors on;
}

# Allow access to user-service login flow (and necessary assets) without authentication
location ~ ^/users/(login|fonts|images|_next/static|403|404|500|faq)(.*)$ {
    limit_except GET POST PUT { deny all; }
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;

    proxy_pass        https://$userservice;
    proxy_set_header X-Origin https://$host;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_cookie_flags ~ httponly secure samesite=strict;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
}

# Allow access to bichard-ui health check, connectivity and static endpoints without authentication
location ~ ^/bichard-ui/(Health|Connectivity|images|css).*$ {
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;
    proxy_pass        https://$app;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_cookie_flags ~ httponly secure samesite=strict;
}

location /bichard-ui/login.jsp {
    absolute_redirect off;
    return 301 /;
}

# Allow access to bichard-backend /Connectivity without authentication 
location /bichard-backend/Connectivity {
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;
    proxy_pass        https://$bichardbackend/bichard-ui/Connectivity;

    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_cookie_flags ~ httponly secure samesite=strict;
}

# Healthcheck endpoint
location /elb-status {
    limit_except GET POST { deny all; }
    add_header  Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    include /etc/includes/headers.conf;
    access_log   off;
    return       200;
    add_header   Content-Type text/plain;
    proxy_cookie_flags ~ httponly secure samesite=strict;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
}

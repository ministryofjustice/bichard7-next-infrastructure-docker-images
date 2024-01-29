access_log                      /dev/stdout json;

proxy_hide_header               Content-Security-Policy;
proxy_ssl_trusted_certificate   /etc/ssl/certs/ca-bundle.crt;

resolver {{ getv "/cjse/nginx/dns/resolver" "127.0.0.11" }};
set $app "{{ getv "/cjse/nginx/app/domain" }}";
set $bichardbackend "{{ getv "/cjse/nginx/bichardbackend/domain" }}";
set $userservice "{{ getv "/cjse/nginx/userservice/domain" }}";
set $ui "{{ getv "/cjse/nginx/ui/domain" }}";
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

# Redirect unauthorised to 403 error page and request with invalid CSRF token to the same page
error_page 403 = @error403;
location @error403 {
    limit_except      GET POST PUT DELETE { deny all; }
    include /etc/includes/headers.conf;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    absolute_redirect off;
    if ($upstream_http_x_status_message = "Invalid CSRF-token") {
        return 302 $request_uri;
    }
    if ($upstream_http_x_status_message != "Invalid CSRF-token") {
        rewrite /(.*) /users/403;
    }
}

# Display error page for 404 and 500 errors
error_page 404 =404 /404;
error_page 500 =500 /500;
location ~ ^/(404|500)$ {
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    limit_except      GET POST PUT { deny all; }
    include /etc/includes/headers.conf;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    rewrite /(.*) /users/$1;
}

# Use API endpoint in user-service for checking authentication
location /auth {
    limit_except      GET POST PUT { deny all; }
    include /etc/includes/headers.conf;

    proxy_pass        https://$userservice/users/api/auth;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};

    proxy_pass_request_body  off;
    proxy_set_header  Content-Length '0';
    proxy_set_header  Referer $request_uri;
    proxy_cookie_flags ~ httponly samesite=strict;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
}

# Proxy for landing page to Bichard
location = / {
    limit_except GET POST PUT DELETE { deny all; }
    include /etc/includes/headers.conf;
    absolute_redirect off;
    return 302 /users;
}

# Proxy through to Bichard
location /bichard-ui {
    limit_except GET POST PUT DELETE { deny all; }
    auth_request /auth;
    auth_request_set $auth_cookie $upstream_http_set_cookie;
    include /etc/includes/headers.conf;
    add_header Set-Cookie $auth_cookie;

    proxy_pass        https://$app;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $http_host;

    proxy_intercept_errors on;
}

# Proxy through to new Bichard UI
location /bichard {
    limit_except GET POST PUT DELETE { deny all; }
    auth_request /auth;
    auth_request_set $auth_cookie $upstream_http_set_cookie;
    include /etc/includes/ui-headers.conf;
    add_header Set-Cookie $auth_cookie;

    proxy_pass        https://$ui;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $http_host;

    # New Bichard UI sets it's own CSP before it reaches nginx
    proxy_pass_header Content-Security-Policy;

    proxy_intercept_errors on;
}

# Proxy through to user-service
location /users {
    limit_except GET POST PUT DELETE { deny all; }
    auth_request /auth;
    auth_request_set $auth_cookie $upstream_http_set_cookie;
    include /etc/includes/user-service-headers.conf;
    add_header Set-Cookie $auth_cookie;

    proxy_pass        https://$userservice;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $host;
    proxy_set_header X-Origin http://$host;

    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    proxy_intercept_errors on;

    # New Bichard User Service sets it's own CSP before it reaches nginx
    proxy_pass_header Content-Security-Policy;
}

# Proxy through to report downloads
location /reports {
    limit_except GET { deny all; }
    auth_request /auth;
    auth_request_set $auth_cookie $upstream_http_set_cookie;
    include /etc/includes/headers.conf;
    add_header Set-Cookie $auth_cookie;

    proxy_pass        https://$staticservice;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $host;

    proxy_intercept_errors on;
}

# Proxy through to help files without auth
location /help {
    limit_except GET { deny all; }
    include /etc/includes/headers.conf;

    proxy_pass        https://$staticservice;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_set_header Host $host;

    proxy_cookie_flags ~ httponly samesite=strict;
    proxy_intercept_errors on;
}

# Allow access to user-service login flow (and necessary assets) without authentication
location ~ ^/users/(login|fonts|images|_next/static|faq)(.*)$ {
    limit_except GET POST PUT { deny all; }
    include /etc/includes/user-service-headers.conf;

    proxy_pass        https://$userservice;
    proxy_set_header X-Origin http://$host;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_cookie_flags ~ httponly samesite=strict;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    proxy_intercept_errors on;

    # New Bichard User Service sets it's own CSP before it reaches nginx
    proxy_pass_header Content-Security-Policy;
}

# Allow access to error pages without authentication
location ~ ^/users/(404|403|500)(.*)$ {
    limit_except GET POST PUT { deny all; }
    include /etc/includes/user-service-headers.conf;

    proxy_pass        https://$userservice;
    proxy_set_header X-Origin https://$host;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_cookie_flags ~ httponly secure samesite=strict;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
    proxy_intercept_errors off;

    # New Bichard User Service sets it's own CSP before it reaches nginx
    proxy_pass_header Content-Security-Policy;
}

# Allow access to bichard-ui health check, connectivity and static endpoints without authentication
location ~ ^/bichard-ui/(Health|Connectivity|images|css).*$ {
    include /etc/includes/headers.conf;
    proxy_pass        https://$app;
    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_cookie_flags ~ httponly samesite=strict;
}

# Allow access to bichard-backend /Connectivity without authentication
location ~ /bichard-backend/(Health|Connectivity) {
    include /etc/includes/headers.conf;
    proxy_pass        https://$bichardbackend/bichard-ui/$1;

    proxy_ssl_verify  {{ getv "/cjse/nginx/proxysslverify" "on" }};
    proxy_cookie_flags ~ httponly secure samesite=strict;
}

location /bichard-ui/login.jsp {
    absolute_redirect off;
    return 301 /;
}

# Healthcheck endpoint
location /elb-status {
    limit_except GET POST { deny all; }
    include /etc/includes/headers.conf;
    access_log   off;
    return       200;
    add_header   Content-Type text/plain;
    proxy_cookie_flags ~ httponly samesite=strict;
    proxy_ssl_server_name on;
    proxy_ssl_verify_depth 2;
}

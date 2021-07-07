ARG BUILD_IMAGE="openjdk:11-jre-slim"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

WORKDIR /

COPY scripts/install_prometheus.sh /tmp/
COPY scripts/run_nginx.sh /bin/run_nginx
COPY files/openssl.cnf /tmp/openssl.cnf

RUN mkdir -p {/config,/certs,/nginx_auth,/var/log/supervisor} && \
  yum update -y && \
  amazon-linux-extras install -y epel && \
  ./tmp/install_prometheus.sh && \
  yum install -y \
    nginx \
    supervisor \
    httpd-tools \
    openssl && \
  chmod +x /bin/run_nginx && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  openssl req \
    -x509 \
    -nodes \
    -days 730 \
    -newkey rsa:4096 \
    -out /certs/server.crt \
    -keyout /certs/server.key \
    -config /tmp/openssl.cnf \
    -extensions 'v3_req' && \
  rm -rf /tmp/openssl.cnf

EXPOSE     9090
VOLUME     ["/prometheus", "/config"]
WORKDIR    /prometheus

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/.htpasswd /nginx_auth/.htpasswd

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

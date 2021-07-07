ARG BUILD_IMAGE="openjdk:11-jre-slim"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

WORKDIR /

COPY scripts/install_prometheus.sh /tmp/
COPY scripts/run_nginx.sh /bin/run_nginx

RUN mkdir -p {/config,/nginx_auth} && \
  ./tmp/install_prometheus.sh && \
  chmod +x /bin/run_nginx && \
  yum clean all && \
  rm -rf /var/cache/yum

EXPOSE     9090
VOLUME     ["/prometheus", "/config"]
WORKDIR    /prometheus

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/.htpasswd /nginx_auth/.htpasswd

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

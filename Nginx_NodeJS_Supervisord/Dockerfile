ARG BUILD_IMAGE="nodejs"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

WORKDIR /

COPY files/openssl.cnf /tmp/openssl.cnf

RUN mkdir -p {/certs,/var/log/supervisor} && \
  yum install -y \
    nginx \
    supervisor \
    httpd-tools && \
  yum -y install https://extras.getpagespeed.com/release-latest.rpm && \
  yum -y install nginx-module-security-headers && \
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

EXPOSE     80
EXPOSE     443
WORKDIR /etc/nginx

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

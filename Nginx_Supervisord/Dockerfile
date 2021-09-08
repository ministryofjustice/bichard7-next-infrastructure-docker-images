ARG BUILD_IMAGE="amazon-linux2-base"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
ARG CONFD_VERSION="0.16.0"

WORKDIR /

COPY files/openssl.cnf /tmp/openssl.cnf

RUN mkdir -p {/certs,/var/log/supervisor} && \
  yum install -y \
    nginx \
    supervisor \
    httpd-tools && \
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
  rm -rf /tmp/openssl.cnf && \
  wget -O /bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
  chmod +x /bin/confd && \
  mkdir -p /etc/confd/{conf.d,templates}

COPY confd /etc/confd/

EXPOSE     80
EXPOSE     443
WORKDIR /etc/nginx

COPY conf/supervisord.conf /etc/supervisord.conf


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

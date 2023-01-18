ARG BUILD_IMAGE="amazon-linux2-base"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
ARG CONFD_VERSION="0.17.0"
ARG CONFD_CHECKSUM="d6215d210c93bfac31d956acb171469f48038dd0f1dbac93722cea884d782aa5"
ARG CONFD_PLATFORM="amd64"

WORKDIR /

COPY files/openssl.cnf /tmp/openssl.cnf

RUN mkdir -p /certs && \
    mkdir -p /var/log/supervisor && \
    yum update && \
    yum install -y yum-utils

COPY files/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum-config-manager --enable nginx-mainline && \
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
  wget -O /bin/confd https://github.com/iwilltry42/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-${CONFD_PLATFORM} -nv && \
  echo "${CONFD_CHECKSUM}  /bin/confd" | sha256sum -c && \
  chmod +x /bin/confd && \
  mkdir -p /etc/confd/conf.d && \
  mkdir -p /etc/confd/templates

COPY confd /etc/confd/

EXPOSE     80
EXPOSE     443
WORKDIR /etc/nginx

COPY conf/supervisord.conf /etc/supervisord.conf


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

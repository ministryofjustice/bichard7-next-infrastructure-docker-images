ARG BUILD_IMAGE="nodejs-2023"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

WORKDIR /

COPY files/openssl.cnf /tmp/openssl.cnf

RUN mkdir -p /certs && \
    mkdir -p /var/log/supervisor && \
    dnf install -y \
      nginx \
      httpd-tools && \
    dnf clean all && \
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

RUN pip install supervisor

EXPOSE     80
EXPOSE     443
WORKDIR /etc/nginx

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["supervisorctl", "-c", "/etc/supervisord.conf"]

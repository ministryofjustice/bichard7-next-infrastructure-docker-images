ARG BUILD_IMAGE="nodejs-20-2023"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

WORKDIR /

COPY files/openssl.cnf /tmp/openssl.cnf

USER root

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

RUN chown -R node:node \
    /certs \
    /var/log/supervisor \
    /var/log/nginx \
    /var/lib/nginx \
    /etc/nginx \

EXPOSE 8080
EXPOSE 8443

WORKDIR /etc/nginx

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

USER node

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

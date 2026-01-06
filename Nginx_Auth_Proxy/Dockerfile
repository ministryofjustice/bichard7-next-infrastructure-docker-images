ARG BUILD_IMAGE="amazon-linux2023-base"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

WORKDIR /

COPY files/openssl.cnf /tmp/openssl.cnf

USER root

RUN mkdir -p /certs && \
    mkdir -p /var/log/supervisor && \
    yum update -y && \
    yum install -y yum-utils

COPY files/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum-config-manager --enable nginx-mainline && \
    yum install -y nginx httpd-tools && \
    pip install supervisor && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    openssl req -x509 -nodes -days 730 -newkey rsa:4096 -out /certs/server.crt \
    -keyout /certs/server.key -config /tmp/openssl.cnf -extensions 'v3_req' && \
    rm -rf /tmp/openssl.cnf

RUN yum install -y gettext

COPY files/templates /etc/templates/
COPY files/supervisord.conf /etc/supervisord.conf
COPY files/includes /etc/nginx/includes/
COPY files/process_templates.sh /bin/process_templates.sh

RUN chmod 755 /bin/process_templates.sh && \
    chown -R appuser:appuser \
    /etc/templates \
    /etc/nginx \
    /certs \
    /var/log/supervisor \
    /var/log/nginx \
    /var/lib/nginx \
    /etc/nginx

EXPOSE 80
EXPOSE 443

WORKDIR /etc/nginx

USER appuser

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

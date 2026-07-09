ARG BUILD_IMAGE="nginx-nodejs-24-2023-supervisord"
FROM ${BUILD_IMAGE}

LABEL org.opencontainers.image.authors="CJSE"

COPY scripts/run_nginx.sh /bin/run_nginx
COPY scripts/credentials.sh /usr/bin/credentials

ARG NODE_DIR="/opt/s3-server"
ARG NODE_USER="node"

USER root

COPY s3-server ${NODE_DIR}

RUN yum install -y --setopt=install_weak_deps=False \
    cronie \
    git && \
    mkdir -p /root/.aws && \
    mkdir -p /nginx_auth && \
    chmod +x /bin/run_nginx && \
    chmod +x /bin/credentials && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    mkdir -p ${NODE_DIR} && \
    chown -R ${NODE_USER} ${NODE_DIR}

# RUN npm i -g npm-check-updates

    USER ${NODE_USER}

WORKDIR ${NODE_DIR}

RUN npm ci && npm cache --minimum-release-age=3 clean --force


USER root
RUN npm link

USER ${NODE_USER}

WORKDIR /

EXPOSE 8080
EXPOSE 8443

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/supervisord.conf /etc/supervisord.conf

STOPSIGNAL SIGQUIT

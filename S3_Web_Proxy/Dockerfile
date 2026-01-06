ARG BUILD_IMAGE="nginx-nodejs-20-2023-supervisord"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

COPY scripts/run_nginx.sh /bin/run_nginx
COPY scripts/credentials.sh /usr/bin/credentials

ARG NODE_DIR="/opt/s3-server"
ARG NODE_USER="node"

USER root

COPY s3-server ${NODE_DIR}

RUN yum install -y \
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

RUN npm i -g npm-check-updates

USER ${NODE_USER}

WORKDIR ${NODE_DIR}

# hadolint ignore=DL3002
RUN ncu -u && npm i

USER root
RUN npm link

USER ${NODE_USER}

WORKDIR /

EXPOSE 80
EXPOSE 443

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/supervisord.conf /etc/supervisord.conf

STOPSIGNAL SIGQUIT

ARG BUILD_IMAGE="nginx-nodejs-supervisord"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

COPY scripts/run_nginx.sh /bin/run_nginx
COPY scripts/credentials.sh /usr/bin/credentials

ARG NODE_DIR="/opt/s3-server"
ARG NODE_USER="runner"

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
    useradd -d ${NODE_DIR} -N -r -s /bin/false ${NODE_USER} && \
    mkdir -p ${NODE_DIR} && \
    chown -R ${NODE_USER} ${NODE_DIR}

USER root
RUN npm i -g npm-check-updates

USER runner
WORKDIR ${NODE_DIR}
RUN ncu -u && npm i

# hadolint ignore=DL3002
USER root
RUN npm link

WORKDIR /

EXPOSE     80
EXPOSE     443

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/supervisord.conf /etc/supervisord.conf

STOPSIGNAL SIGQUIT

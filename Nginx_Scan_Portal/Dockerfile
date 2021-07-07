ARG BUILD_IMAGE="nginx-supervisord"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

COPY scripts/run_nginx.sh /bin/run_nginx
COPY scripts/credentials.sh /usr/bin/credentials

ARG NODE_DIR="/opt/s3-server"
ARG NODE_USER="runner"

RUN yum install -y \
        cronie && \
    curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
    yum install -y nodejs && \
    mkdir -p {/root/.aws,/nginx_auth} && \
    chmod +x /bin/run_nginx && \
    chmod +x /bin/credentials && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    useradd -d ${NODE_DIR} -N -r -s /bin/false ${NODE_USER} && \
    mkdir -p ${NODE_DIR} && \
    chown -R ${NODE_USER} ${NODE_DIR}

USER runner
WORKDIR ${NODE_DIR}
RUN git init && \
    git remote add origin https://github.com/quintoandar/s3-server.git && \
    git fetch origin && \
    git checkout -b master --track origin/master && \
    git clone https://github.com/quintoandar/s3-server.git

COPY files/list.html /opt/s3-server/s3-server/lib/list.html

USER root
RUN  npm install -g s3-server

WORKDIR /

EXPOSE     80
EXPOSE     443

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/.htpasswd /nginx_auth/.htpasswd

STOPSIGNAL SIGQUIT

ARG BUILD_IMAGE="amazonlinux:2"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

COPY scripts/run_nginx.sh /bin/run_nginx
COPY scripts/credentials.sh /usr/bin/credentials
COPY files/openssl.cnf /tmp/openssl.cnf

ARG NODE_DIR="/opt/s3-server"
ARG NODE_USER="runner"

RUN yum update -y && \
    amazon-linux-extras install -y epel && \
    yum install -y \
        supervisor \
        cronie \
        python-pip \
        gettext \
        gzip \
        nginx \
        tar \
        git \
        unzip \
        httpd-tools \
        openssl && \
    curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
    yum install -y nodejs && \
    pip install awscli jq && \
    mkdir -p {/root/.aws,/certs,/nginx_auth,/var/log/supervisor} && \
    chmod +x /bin/run_nginx && \
    chmod +x /bin/credentials && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    useradd -d ${NODE_DIR} -N -r -s /bin/false ${NODE_USER} && \
    mkdir -p ${NODE_DIR} && \
    chown -R ${NODE_USER} ${NODE_DIR} && \
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

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

STOPSIGNAL SIGQUIT

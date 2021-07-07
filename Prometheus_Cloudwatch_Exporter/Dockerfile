ARG BUILD_IMAGE="openjdk:11-jre-slim"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"
EXPOSE 9106

WORKDIR /

COPY scripts/credentials.sh /usr/bin/credentials
COPY scripts/install_cloudwatch_exporter.sh /tmp/install_cloudwatch_exporter.sh
COPY files/openssl.cnf /tmp/openssl.cnf

RUN mkdir -p ~/.aws && \
  yum update -y && \
  chmod +x /usr/bin/credentials && \
  amazon-linux-extras install -y epel && \
	yum install -y \
	  nginx \
    supervisor \
    cronie \
    python-pip \
    openssl && \
	pip install awscli jq && \
	mkdir -p {/var/log/supervisor,/config,/certs} && \
  bash /tmp/install_cloudwatch_exporter.sh && \
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
  rm -rf /tmp/openssl.cnf

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/config.yml /config/config.yml
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/config /root/.aws/config
COPY conf/crontab /var/spool/cron/root
CMD ["/usr/bin/supervisord"]

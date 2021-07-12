ARG BUILD_IMAGE="nginx-java-supervisord"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

WORKDIR /

COPY scripts/credentials.sh /usr/bin/credentials
COPY scripts/install_cloudwatch_exporter.sh /tmp/install_cloudwatch_exporter.sh

RUN mkdir -p ~/.aws && \
  yum install -y cronie && \
  chmod +x /usr/bin/credentials && \
  mkdir -p /config && \
  bash /tmp/install_cloudwatch_exporter.sh && \
  rm /tmp/install_cloudwatch_exporter.sh && \
  yum clean all && \
  rm -rf /var/cache/yum

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/config.yml /config/config.yml
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/config /root/.aws/config
COPY conf/crontab /var/spool/cron/root

EXPOSE 9106

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

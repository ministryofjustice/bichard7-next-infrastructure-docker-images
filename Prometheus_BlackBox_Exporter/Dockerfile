ARG BUILD_IMAGE="nginx-java-supervisord"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

WORKDIR /

COPY scripts/install_blackbox_exporter.sh /tmp/install_blackbox_exporter.sh

RUN mkdir -p ~/.aws && \
  mkdir -p /config && \
  bash /tmp/install_blackbox_exporter.sh && \
  rm /tmp/install_blackbox_exporter.sh && \
  yum clean all && \
  rm -rf /var/cache/yum

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/blackbox.yml /config/config.yml
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 9115

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]


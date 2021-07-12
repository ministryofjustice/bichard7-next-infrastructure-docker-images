ARG BUILD_IMAGE="nginx-java-supervisord"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

WORKDIR /

COPY scripts/install_prometheus.sh /tmp/
COPY scripts/run_nginx.sh /bin/run_nginx

ARG ALERT_USER="alert-forwarder"
ARG ALERT_GUID=1001

RUN mkdir -p {/config,/nginx_auth} && \
  /bin/bash /tmp/install_prometheus.sh && \
  rm /tmp/install_prometheus.sh && \
  chmod +x /bin/run_nginx && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  groupadd --gid ${ALERT_GUID} ${ALERT_USER} && \
  useradd --uid ${ALERT_GUID} --gid ${ALERT_USER} --shell /bin/bash --create-home ${ALERT_USER} && \
  cd /tmp && \
  wget https://github.com/DataReply/alertmanager-sns-forwarder/releases/download/0.2/alertmanager-sns-forwarder-linux_amd64.tar.gz && \
  tar -xf alertmanager-sns-forwarder-linux_amd64.tar.gz && \
  cp /tmp/bin/linux/alertmanager-sns-forwarder /bin/. && \
  chmod +x /bin/alertmanager-sns-forwarder && \
  rm -rf /tmp/bin && \
  rm alertmanager-sns-forwarder-linux_amd64.tar.gz

WORKDIR /

EXPOSE     9090
VOLUME     ["/prometheus", "/config"]
WORKDIR    /prometheus

COPY conf/prometheus.yml /etc/prometheus/prometheus.yml
COPY conf/web-config.yml /etc/prometheus/web-config.yml
RUN chown nobody:nobody /etc/prometheus/*.yml
COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/.htpasswd /nginx_auth/.htpasswd

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

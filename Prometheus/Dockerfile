ARG BUILD_IMAGE="nginx-java-supervisord"
FROM ${BUILD_IMAGE}
LABEL maintainer="CJSE"

WORKDIR /

COPY scripts/install_prometheus.sh /tmp/
COPY scripts/run_nginx.sh /bin/run_nginx

ARG ALERT_USER="alert-forwarder"
ARG ALERT_GUID=1001
ARG CONFD_VERSION="0.16.0"
ARG CONFD_CHECKSUM="255d2559f3824dd64df059bdc533fd6b697c070db603c76aaf8d1d5e6b0cc334"
ARG ALERT_MANAGER_CHECKSUM="7a8a76102a3c9ac4f4d016fe23dafef449b5eac812dd49ebe71440e891b49ba6"
ENV LOG_LEVEL="info"

RUN mkdir -p /config && \
  mkdir -p /nginx_auth && \
  /bin/bash /tmp/install_prometheus.sh && \
  rm /tmp/install_prometheus.sh && \
  chmod +x /bin/run_nginx && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  groupadd --gid ${ALERT_GUID} ${ALERT_USER} && \
  useradd --uid ${ALERT_GUID} --gid ${ALERT_USER} --shell /bin/bash --create-home ${ALERT_USER}

WORKDIR /tmp
RUN wget https://github.com/DataReply/alertmanager-sns-forwarder/releases/download/0.2/alertmanager-sns-forwarder-linux_amd64.tar.gz -nv && \
  echo "${ALERT_MANAGER_CHECKSUM}  alertmanager-sns-forwarder-linux_amd64.tar.gz" | sha256sum -c && \
  tar -xf alertmanager-sns-forwarder-linux_amd64.tar.gz && \
  cp /tmp/bin/linux/alertmanager-sns-forwarder /bin/. && \
  chmod +x /bin/alertmanager-sns-forwarder && \
  rm -rf /tmp/bin && \
  rm alertmanager-sns-forwarder-linux_amd64.tar.gz && \
  wget -O /bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -nv && \
  echo "${CONFD_CHECKSUM}  /bin/confd" | sha256sum -c && \
  chmod +x /bin/confd && \
  mkdir -p /etc/confd/conf.d && \
  mkdir -p /etc/confd/templates

COPY confd /etc/confd/

WORKDIR /
#Sns Alert Manager
EXPOSE     9088
#Prometheus
EXPOSE     9090
#Prometheus Alert Manager
EXPOSE     9092

VOLUME     ["/prometheus", "/config"]
WORKDIR    /prometheus

COPY conf/prometheus.yml /etc/prometheus/prometheus.yml
COPY conf/web-config.yml /etc/prometheus/web-config.yml
RUN chown nobody:nobody /etc/prometheus/*.yml
COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/.htpasswd /nginx_auth/.htpasswd

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

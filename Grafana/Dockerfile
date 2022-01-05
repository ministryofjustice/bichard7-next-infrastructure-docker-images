ARG BUILD_IMAGE="amazon-linux2-base"
FROM ${BUILD_IMAGE}

COPY files/openssl.cnf /tmp/
ARG GRAFANA_VERSION="8.0.5"
ARG CONFD_VERSION="0.16.0"

COPY ./scripts/run_grafana.sh /bin/

ENV PATH="/usr/share/grafana/bin:$PATH" \
    GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
    GF_PATHS_DATA="/var/lib/grafana" \
    GF_PATHS_HOME="/usr/share/grafana" \
    GF_PATHS_LOGS="/var/log/grafana" \
    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
    GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

RUN mkdir -p /certs && \
    yum install -y https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}-1.x86_64.rpm && \
    yum install -y \
        supervisor \
        httpd-tools && \
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
    rm -rf /tmp/openssl.cnf && \
    chown -R grafana /certs && \
    chown -R grafana /etc/grafana/provisioning/ && \
    mkdir -p /opt/grafana/dashboards && \
    chown -R grafana /opt/grafana && \
    chmod +x /bin/run_grafana.sh && \
    wget -O /bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -nv && \
    chmod +x /bin/confd && \
    mkdir -p /etc/confd/conf.d && \
    mkdir -p /etc/confd/templates


COPY files/prometheus_datasource.yml /etc/grafana/provisioning/datasources/
COPY files/bichard_dashboard.yml /etc/grafana/provisioning/dashboards/
COPY files/prometheus-alertmanager-channel.yml /etc/grafana/provisioning/notifiers/
COPY files/dashboard/ /opt/grafana/dashboards
COPY conf/supervisord.conf /etc/supervisord.conf
COPY ./confd /etc/confd/

RUN sed -i 's/;protocol = http/protocol = https/' /etc/grafana/grafana.ini && \
    sed -i 's/;router_logging = false/router_logging = true/' /etc/grafana/grafana.ini && \
    sed -i 's/;enable_gzip = false/enable_gzip = true/' /etc/grafana/grafana.ini && \
    sed -i 's/;cert_file =/cert_file = \/certs\/server.crt/' /etc/grafana/grafana.ini && \
    sed -i 's/;cert_key =/cert_key = \/certs\/server.key/' /etc/grafana/grafana.ini && \
    chown -R grafana:grafana /etc/grafana/provisioning /opt/grafana

EXPOSE 3000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

ARG BUILD_IMAGE="grafana/grafana:8.0.2"
FROM ${BUILD_IMAGE}

COPY files/openssl.cnf /tmp/
COPY files/prometheus_datasource.yml /etc/grafana/provisioning/datasources/
COPY files/bichard_dashboard.yml /etc/grafana/provisioning/dashboards/

USER root

RUN mkdir -p /certs && \
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
      chown -R grafana /opt/grafana

RUN sed -i 's/;protocol = http/protocol = https/' /etc/grafana/grafana.ini && \
    sed -i 's/;router_logging = false/router_logging = true/' /etc/grafana/grafana.ini && \
    sed -i 's/;enable_gzip = false/enable_gzip = true/' /etc/grafana/grafana.ini && \
    sed -i 's/;cert_file =/cert_file = \/certs\/server.crt/' /etc/grafana/grafana.ini && \
    sed -i 's/;cert_key =/cert_key = \/certs\/server.key/' /etc/grafana/grafana.ini

USER grafana

COPY files/dashboard/ /opt/grafana/dashboards

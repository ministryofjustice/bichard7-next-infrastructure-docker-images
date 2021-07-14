---

alerting:
  alertmanagers:
    - static_configs:
        - targets: []

scrape_configs:
  - job_name: 'prometheus'
    scheme: "https"
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    static_configs:
      - targets: ['localhost:9091']
  - job_name: 'cloudwatch_exporter'
    honor_labels: true
    scheme: "https"
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    static_configs:
      - targets:
        - {{getv "/cjse/prometheus/cloudwatch/exporter/fqdn" "localhost"}}:9106

...

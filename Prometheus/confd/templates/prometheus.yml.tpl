---

alerting:
  alertmanagers:
    - static_configs:
        - targets:
          - localhost:9093

scrape_configs:
  - job_name: 'blackbox_exporter'
    honor_labels: true
    scheme: "https"
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    static_configs:
      - targets:
        - {{getv "/cjse/prometheus/blackbox/exporter/fqdn" "localhost"}}:9116
  - job_name: 'blackbox_http'
    metrics_path: '/probe'
    scheme: 'https'
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    params:
      module:
        - http_frontend
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: {{getv "/cjse/prometheus/blackbox/exporter/fqdn" "localhost"}}:9116
    static_configs:
    - targets:
        - https://app.{{getv "/cjse/fqdn/suffix" "cjse.org"}}/bichard-ui/Health
        - https://audit.{{getv "/cjse/fqdn/suffix" "cjse.org"}}/audit-logging/api/status
        - https://grafana.{{getv "/cjse/fqdn/suffix" "cjse.org"}}
        # This url will require us to set an X-ORIGIN header
        # See https://github.com/prometheus/blackbox_exporter/blob/master/example.yml#L10
        # - https://users.{{getv "/cjse/fqdn/suffix" "cjse.org"}}/users/login
  - job_name: 'blackbox_http_auth'
    metrics_path: '/probe'
    scheme: 'https'
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    params:
      module:
        - http_auth_required
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: {{getv "/cjse/prometheus/blackbox/exporter/fqdn" "localhost"}}:9116
    static_configs:
    - targets:
        - https://alerts.{{getv "/cjse/fqdn/suffix" "cjse.org"}}
        - https://elasticsearch.{{getv "/cjse/fqdn/suffix" "cjse.org"}}
        - https://prometheus.{{getv "/cjse/fqdn/suffix" "cjse.org"}}
{{ if exists "/cjse/use/smtp/service" }}
{{ if eq (getv "/cjse/use/smtp/service" "false") "true" }}
  - job_name: node
    scheme: "https"
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    relabel_configs:
      - source_labels: [ __address__ ]
        target_label: __param_target
      - source_labels: [ __param_target ]
        target_label: instance
      - target_label: __address__
        replacement: 'mail.cjse.org:9100'
    static_configs:
    - targets:
        - mail.cjse.org
  - job_name: postfix
    scheme: "https"
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    relabel_configs:
      - source_labels: [ __address__ ]
        target_label: __param_target
      - source_labels: [ __param_target ]
        target_label: instance
      - target_label: __address__
        replacement: 'mail.cjse.org:9154'
    static_configs:
    - targets:
        - mail.cjse.org
{{end}}
{{end}}
  - job_name: 'prometheus'
    scheme: "https"
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    static_configs:
      - targets: ['localhost:9091']
  - job_name: 'sns-alert-forwarder'
    scheme: "https"
    tls_config:
      cert_file: /certs/server.crt
      key_file: /certs/server.key
      insecure_skip_verify: true
    static_configs:
      - targets: ['localhost:9088']
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

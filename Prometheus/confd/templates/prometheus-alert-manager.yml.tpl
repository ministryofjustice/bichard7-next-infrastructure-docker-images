---

global:

route:
  receiver: 'sns-forwarder'
  group_by: [alertname, datacenter, app]

receivers:
- name: 'sns-forwarder'
  webhook_configs:
  - send_resolved: True
    url: 'http://{{getv "/cjse/prometheus/alert/url" "localhost"}}:9087/alert/{{getv "/cjse/prometheus/alert/snstopic" "alerts"}}'

...

{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "links": [],
  "panels": [
    {
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 11,
      "title": "Row title",
      "type": "row"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "max": 3,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 0
              },
              {
                "color": "dark-green",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 1
      },
      "id": 8,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "auto"
      },
      "pluginVersion": "8.0.2",
      "targets": [
        {
          "exemplar": true,
          "expr": "ecs_containerinsights_desired_task_count_sum{service_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" "e2e-test" }}-base-infra\"}",
          "interval": "",
          "legendFormat": "Desired Containers",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "ecs_containerinsights_running_task_count_sum{service_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" "e2e-test" }}-base-infra\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Running Containers",
          "refId": "B"
        },
        {
          "exemplar": true,
          "expr": "aws_applicationelb_healthy_host_count_average{availability_zone=~\"eu-west-2a|eu-west-2b|eu-west-2c\",target_group=\"{{getv "/cjse/infra/bichard/targetgroup" ""}}\"}",
          "hide": false,
          "instant": false,
          "interval": "",
          "legendFormat": "Healthy Hosts {{"{{"}}load_balancer{{"}}"}}",
          "refId": "C"
        }
      ],
      "title": "Bichard Container Status",
      "transformations": [
        {
          "id": "groupBy",
          "options": {
            "fields": {
              "Healthy Hosts": {
                "aggregations": [
                  "first"
                ],
                "operation": "aggregate"
              }
            }
          }
        }
      ],
      "type": "stat"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 12,
        "y": 1
      },
      "id": 2,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_ecs_cpuutilization_average{cluster_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" "e2e-test" }}-base-infra\"}",
          "interval": "",
          "legendFormat": "CPU Usage",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_ecs_memory_utilization_average{cluster_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" "e2e-test" }}-base-infra\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Memory Usage",
          "refId": "B"
        },
        {
          "exemplar": true,
          "expr": "aws_applicationelb_healthy_host_count_average{load_balancer=\"{{getv "/cjse/infra/bichard/loadbalancer" "" }}\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Health Hosts {{"{{"}}load_balancer{{"}}"}}",
          "refId": "C"
        }
      ],
      "title": "Bichard Application ECS Container Metrics",
      "type": "timeseries"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 10
      },
      "id": 4,
      "options": {
        "displayMode": "gradient",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showUnfilled": true,
        "text": {}
      },
      "pluginVersion": "8.0.2",
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_amazonmq_total_producer_count_sum{broker=~\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-1|cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-2\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Total Producers",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_total_consumer_count_sum{broker=~\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-1|cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-2\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Total Consumers",
          "refId": "C"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_total_message_count_sum{broker=~\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-1|cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-2\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Total Messages {{"{{"}}broker{{"}}"}}",
          "refId": "D"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_total_enqueue_count_sum{broker=~\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-1|cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-2\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Enqueued Messages",
          "refId": "E"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_total_dequeue_count_sum{broker=~\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-1|cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-amq-2\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Dequeued Messages",
          "refId": "F"
        }
      ],
      "title": "Bichard Queues",
      "type": "bargauge"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 6,
        "x": 12,
        "y": 10
      },
      "id": 12,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_ecs_cpuutilization_average{cluster_name=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-beanconnect\"}",
          "interval": "",
          "legendFormat": "CPU Usage",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_ecs_memory_utilization_average{cluster_name=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-beanconnect\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Memory Usage",
          "refId": "B"
        },
        {
          "exemplar": true,
          "expr": "aws_networkelb_healthy_host_count_average{load_balancer=\"net/cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-beanconn/07113ed748fb44e9\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Health Hosts",
          "refId": "C"
        }
      ],
      "title": "Beanconnect",
      "type": "timeseries"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 6,
        "x": 18,
        "y": 10
      },
      "id": 13,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_ecs_cpuutilization_average{cluster_name=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-pncemulator\"}",
          "interval": "",
          "legendFormat": "CPU Usage",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_ecs_memory_utilization_average{cluster_name=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-pncemulator\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Memory Usage",
          "refId": "B"
        },
        {
          "exemplar": true,
          "expr": "aws_networkelb_healthy_host_count_average{load_balancer=\"net/cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-pncemula/b215d76f45dbda50\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "NLB healthy Count",
          "refId": "C"
        }
      ],
      "title": "PNC",
      "type": "timeseries"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 19
      },
      "id": 3,
      "options": {
        "displayMode": "gradient",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showUnfilled": true,
        "text": {}
      },
      "pluginVersion": "8.0.2",
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_ecs_cpuutilization_average{cluster_name=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-monitoring\"}",
          "interval": "",
          "legendFormat": "CPU Utilisation {{"{{"}}broker{{"}}"}}",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_ecs_memory_utilization_average{cluster_name=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-monitoring\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Memory Utilisation {{"{{"}}broker{{"}}"}}",
          "refId": "B"
        }
      ],
      "title": "Monitoring ECS Container Metrics",
      "type": "bargauge"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 6,
        "x": 12,
        "y": 19
      },
      "id": 6,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_rds_cpuutilization_average{dbcluster_identifier=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-aurora-cluster\"}",
          "interval": "",
          "legendFormat": "CPU Uitilsation {{"{{"}}broker{{"}}"}}",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_rds_database_connections_sum{dbcluster_identifier=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-aurora-cluster\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "DB Connections {{"{{"}}broker{{"}}"}}",
          "refId": "B"
        }
      ],
      "title": "Bichard DB Metrics",
      "type": "timeseries"
    },
    {
      "datasource": null,
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 6,
        "x": 18,
        "y": 19
      },
      "id": 9,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_rds_free_local_storage_sum{dbcluster_identifier=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-aurora-cluster\"}",
          "interval": "",
          "legendFormat": "Free Storage",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_rds_volume_bytes_used_sum{dbcluster_identifier=\"cjse-{{getv "/cjse/infra/envname" "e2e-test" }}-bichard-7-aurora-cluster\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "Used Storage",
          "refId": "B"
        }
      ],
      "title": "Bichard DB Storage",
      "type": "timeseries"
    }
  ],
  "refresh": "",
  "schemaVersion": 30,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Bichard7 {{getv "/cjse/infra/envname" "e2e-test" }} system status"
}

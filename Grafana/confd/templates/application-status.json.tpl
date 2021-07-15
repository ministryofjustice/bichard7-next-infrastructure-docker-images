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
  "id": 5,
  "links": [],
  "panels": [
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
        "y": 0
      },
      "id": 2,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "text": {}
      },
      "pluginVersion": "8.0.2",
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_applicationelb_healthy_host_count_average{target_group=\"{{getv "/cjse/infra/bichard/targetgroup" ""}}\"}",
          "interval": "",
          "legendFormat": "Instance count in {{"{{"}}availability_zone{{"}}"}}",
          "refId": "A"
        }
      ],
      "title": "Running  Bichard Containers",
      "type": "gauge"
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
        "x": 12,
        "y": 0
      },
      "id": 3,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "text": {}
      },
      "pluginVersion": "8.0.2",
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_applicationelb_healthy_host_count_average{load_balancer=\"{{getv "/cjse/infra/userservice/targetgroup" ""}}\"}",
          "interval": "",
          "legendFormat": "Running Instances",
          "refId": "A"
        }
      ],
      "title": "Running User Service Containers",
      "type": "gauge"
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
        "y": 9
      },
      "id": 5,
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
          "expr": "aws_applicationelb_healthy_host_count_average{load_balancer=~\"{{getv "/cjse/prometheus/alb" "" }}|{{getv "/cjse/grafana/alb" ""}}|{{getv "/cjse/cwatch/alb" "" }}\"}",
          "interval": "",
          "legendFormat": "Instance count in {{"{{"}}availability_zone{{"}}"}} {{"{{"}}load_balancer{{"}}"}}",
          "refId": "A"
        }
      ],
      "title": "Running  Monitoring Containers",
      "type": "bargauge"
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
        "x": 12,
        "y": 9
      },
      "id": 4,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "text": {}
      },
      "pluginVersion": "8.0.2",
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_applicationelb_healthy_host_count_average{load_balancer=\"{{getv "/cjse/audit/alb" "" }}\"}",
          "interval": "",
          "legendFormat": "Instance count in {{"{{"}}availability_zone{{"}}"}}",
          "refId": "A"
        }
      ],
      "title": "Running  Audit Logging Containers",
      "type": "gauge"
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
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 18
      },
      "id": 7,
      "options": {
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "text": {}
      },
      "pluginVersion": "8.0.2",
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_networkelb_healthy_host_count_average{target_group=\"{{getv "/cjse/beanconnect/nlb" "" }}\"}",
          "interval": "",
          "legendFormat": "Running Instances",
          "refId": "A"
        }
      ],
      "title": "Beanconnect Containers",
      "type": "gauge"
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
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 18
      },
      "id": 8,
      "options": {
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "text": {}
      },
      "pluginVersion": "8.0.2",
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_rds_database_connections_maximum{dbcluster_identifier=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-aurora-cluster\"}",
          "interval": "",
          "legendFormat": "DB Connections Application",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_rds_database_connections_maximum{dbinstance_identifier=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-grafana\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "DB Connections Monitoring",
          "refId": "B"
        }
      ],
      "title": "DB Connections",
      "type": "gauge"
    }
  ],
  "refresh": false,
  "schemaVersion": 30,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-15m",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Bichard {{getv "/cjse/infra/envname" ""}} status"
}

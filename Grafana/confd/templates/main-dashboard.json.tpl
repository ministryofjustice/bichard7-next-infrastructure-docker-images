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
  "graphTooltip": 1,
  "id": 41,
  "links": [],
  "panels": [
    {
      "collapsed": false,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 9,
      "panels": [],
      "title": "Queues",
      "type": "row"
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
        "h": 6,
        "w": 11,
        "x": 0,
        "y": 1
      },
      "id": 11,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_amazonmq_dequeue_count_average{queue=\"COURT_RESULT_INPUT_QUEUE\"}",
          "instant": false,
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Incoming message rate (COURT_RESULT_INPUT_QUEUE)",
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
            "axisPlacement": "left",
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
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 11,
        "x": 11,
        "y": 1
      },
      "id": 2,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_amazonmq_queue_size_sum{queue=~\"AUDIT_EVENT_QUEUE|AUDIT_EVENT_QUEUE.FAILURE|COURT_RESULT_INPUT_QUEUE|COURT_RESULT_INPUT_QUEUE.FAILURE|DATA_SET_PNC_UPDATE_QUEUE|DATA_SET_PNC_UPDATE_QUEUE.FAILURE|GENERAL_EVENT_QUEUE|HEARING_OUTCOME_INPUT_QUEUE|HEARING_OUTCOME_INPUT_QUEUE.FAILURE|HEARING_OUTCOME_PNC_UPDATE_QUEUE|HEARING_OUTCOME_PNC_UPDATE_QUEUE.FAILURE|PNC_UPDATE_REQUEST_QUEUE|PNC_UPDATE_REQUEST_QUEUE.FAILURE\"}",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Queue Size",
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
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 11,
        "x": 0,
        "y": 7
      },
      "id": 13,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_amazonmq_cpu_utilization_average{}",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Amazon MQ CPU Usage",
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
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 11,
        "x": 11,
        "y": 7
      },
      "id": 15,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_amazonmq_consumer_count_sum{queue=~\"AUDIT_EVENT_QUEUE|AUDIT_EVENT_QUEUE.FAILURE|COURT_RESULT_INPUT_QUEUE|COURT_RESULT_INPUT_QUEUE.FAILURE|DATA_SET_PNC_UPDATE_QUEUE|DATA_SET_PNC_UPDATE_QUEUE.FAILURE|GENERAL_EVENT_QUEUE|HEARING_OUTCOME_INPUT_QUEUE|HEARING_OUTCOME_INPUT_QUEUE.FAILURE|HEARING_OUTCOME_PNC_UPDATE_QUEUE|HEARING_OUTCOME_PNC_UPDATE_QUEUE.FAILURE|PNC_UPDATE_REQUEST_QUEUE|PNC_UPDATE_REQUEST_QUEUE.FAILURE\"}",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Queue Consumers",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 13
      },
      "id": 7,
      "panels": [],
      "title": "Bichard",
      "type": "row"
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
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "aws_ecs_cpuutilization_average{cluster_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra\", job=\"aws_ecs\", service_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra-backend\"}"
            },
            "properties": [
              {
                "id": "displayName",
                "value": "Backend"
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "aws_ecs_cpuutilization_average{cluster_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra\", job=\"aws_ecs\", service_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra-web\"}"
            },
            "properties": [
              {
                "id": "displayName",
                "value": "Web"
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 6,
        "w": 11,
        "x": 0,
        "y": 14
      },
      "id": 4,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_ecs_cpuutilization_average{service_name=~\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra-backend|cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra-web\"}",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Bichard CPU",
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
          }
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "aws_ecs_memory_utilization_average{cluster_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra\", job=\"aws_ecs\", service_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra-backend\"}"
            },
            "properties": [
              {
                "id": "displayName",
                "value": "Backend"
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "aws_ecs_memory_utilization_average{cluster_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra\", job=\"aws_ecs\", service_name=\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra-web\"}"
            },
            "properties": [
              {
                "id": "displayName",
                "value": "Web"
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 6,
        "w": 11,
        "x": 11,
        "y": 14
      },
      "id": 5,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "aws_ecs_memory_utilization_average{service_name=~\"cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra-backend|cjse-bichard7-{{getv "/cjse/infra/envname" ""}}-base-infra-web\"}",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Bichard Memory",
      "type": "timeseries"
    }
  ],
  "refresh": "10s",
  "schemaVersion": 30,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Main Dashboard",
  "uid": "Sh6172pnz"
}
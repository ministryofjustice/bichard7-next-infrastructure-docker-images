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
        "w": 12,
        "x": 0,
        "y": 0
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
          "expr": "aws_amazonmq_dispatch_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE\"}",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_producer_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "B"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_dequeue_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "C"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_enqueue_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "D"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_queue_size_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "E"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_consumer_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "F"
        }
      ],
      "title": "Court Result Input Queue Metrics",
      "transformations": [],
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
        "h": 9,
        "w": 12,
        "x": 12,
        "y": 0
      },
      "id": 3,
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
          "expr": "aws_amazonmq_dispatch_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE.FAILURE\"}",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_producer_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE.FAILURE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "B"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_dequeue_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE.FAILURE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "C"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_enqueue_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE.FAILURE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "D"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_queue_size_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE.FAILURE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "E"
        },
        {
          "exemplar": true,
          "expr": "aws_amazonmq_consumer_count_average{broker=\"cjse-{{getv "/cjse/infra/envname" ""}}-bichard-7-amq-2\", job=\"aws_amazonmq\", queue=\"COURT_RESULT_INPUT_QUEUE.FAILURE\"}",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "F"
        }
      ],
      "title": "Court Result Input Failure Queue Metrics",
      "transformations": [],
      "type": "timeseries"
    }
  ],
  "refresh": "",
  "schemaVersion": 30,
  "style": "dark",
  "tags": [
    "AMQ",
    "Prometheus",
    "Grafana"
  ],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Court Result Input Queue Metrics",
  "uid": "r67Hj4pnk",
  "version": 5
}

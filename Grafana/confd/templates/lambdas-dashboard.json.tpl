{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "description": "",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 190,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 14,
      "panels": [],
      "title": "Overview",
      "type": "row"
    },
    {
      "datasource": null,
      "description": "",
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 10,
        "w": 5,
        "x": 0,
        "y": 1
      },
      "id": 55,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": true,
          "expr": "aws_lambda_errors_sum",
          "format": "table",
          "legendFormat": "All lambdas",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Total Errors",
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 10,
        "w": 19,
        "x": 5,
        "y": 1
      },
      "id": 112,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(aws_lambda_errors_sum)",
          "format": "time_series",
          "legendFormat": "All lambdas",
          "range": true,
          "refId": "A"
        }
      ],
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 4,
        "x": 0,
        "y": 11
      },
      "id": 6,
      "links": [],
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-transfer-messages|bichard-7-.*-record-sent-to-bichard-event|bichard-7-.*-send-to-bichard|bichard-7-.*-store-message|bichard-7-.*-transfer-messages\"})",
          "format": "time_series",
          "instant": false,
          "legendFormat": "Incoming message handler lambdas",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Incoming Message Handler",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 4,
        "y": 11
      },
      "id": 113,
      "links": [],
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-transfer-messages|bichard-7-.*-record-sent-to-bichard-event|bichard-7-.*-send-to-bichard|bichard-7-.*-store-message|bichard-7-.*-transfer-messages\"})",
          "format": "time_series",
          "instant": false,
          "legendFormat": "Incoming message handler lambdas",
          "range": true,
          "refId": "A"
        }
      ],
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 4,
        "x": 12,
        "y": 11
      },
      "id": 4,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-message-receiver|bichard-7-.*-store-event\"})",
          "format": "time_series",
          "instant": false,
          "legendFormat": "Event handler lambdas",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Event Handler",
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 11
      },
      "id": 114,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-message-receiver|bichard-7-.*-store-event\"})",
          "format": "time_series",
          "instant": false,
          "legendFormat": "Event handler lambdas",
          "range": true,
          "refId": "A"
        }
      ],
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 4,
        "x": 0,
        "y": 17
      },
      "id": 8,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-report\"})",
          "format": "time_series",
          "legendFormat": "Reporting lambdas",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Reporting",
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in reporting lambdas",
        "name": "Reporting lambdas alert",
        "noDataState": "no_data",
        "notifications": []
      },
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 4,
        "y": 17
      },
      "id": 115,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-report\"})",
          "format": "time_series",
          "legendFormat": "Reporting lambdas",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 4,
        "x": 12,
        "y": 17
      },
      "id": 2,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-create-audit-log|bichard-7-.*-create-audit-log-event|bichard-7-.*-get-messages|bichard-7-.*-retry-message\"})",
          "format": "time_series",
          "legendFormat": "Audit Log API lambdas",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Audit Log API",
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in Audit Log API lambdas",
        "name": "Audit Log API lambdas alert",
        "noDataState": "no_data",
        "notifications": []
      },
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 17
      },
      "id": 116,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-create-audit-log|bichard-7-.*-create-audit-log-event|bichard-7-.*-get-messages|bichard-7-.*-retry-message\"})",
          "format": "time_series",
          "legendFormat": "Audit Log API lambdas",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 4,
        "x": 0,
        "y": 23
      },
      "id": 10,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-archive-user-logs|bichard-7-.*-add-archival-events|bichard-7-.*-retry-failed-messages|cjse-bichard7-.*-base-infra-opensearch-snapshot-lambda|.*-query-pnc-connection|bichard-7-.*-resubmit-pnc-failures|secrets_rotation_lambda\"})",
          "format": "table",
          "instant": false,
          "legendFormat": "Other lambdas",
          "range": true,
          "refId": "query0"
        }
      ],
      "title": "Others",
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
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 4,
        "y": 23
      },
      "id": 117,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "sum(aws_lambda_errors_sum{function_name=~\"bichard-7-.*-archive-user-logs|bichard-7-.*-add-archival-events|bichard-7-.*-retry-failed-messages|cjse-bichard7-.*-base-infra-opensearch-snapshot-lambda|.*-query-pnc-connection|bichard-7-.*-resubmit-pnc-failures|secrets_rotation_lambda\"})",
          "format": "time_series",
          "instant": false,
          "legendFormat": "Other lambdas",
          "range": true,
          "refId": "query0"
        }
      ],
      "title": "Others",
      "type": "timeseries"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 29
      },
      "id": 12,
      "panels": [],
      "title": "Audit Logging - Incoming Message Handler",
      "type": "row"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 30
      },
      "id": 45,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-transfer-messages\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in Transfer Messages lambda",
        "name": "Transfer Messages lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 30
      },
      "id": 56,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-transfer-messages\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 30
      },
      "id": 48,
      "options": {
        "content": "## Transfer Messages\nThis lambda transfers messages (uploaded by ExISS) from external incoming messages bucket to internal incoming messages bucket.\n\nThen incoming message handler step function is executed for each new message in S3 bucket.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda function has S3 permissions to copy from incoming messages bucket to internal incoming messages bucket.",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 38
      },
      "id": 43,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-store-message\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 38
      },
      "id": 58,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-store-message\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 38
      },
      "id": 57,
      "options": {
        "content": "## Store Messages\nThis lambda validates and formats the received court result XML.\nThen it creates a record in DynamoDB via Audit Log API and pass the formatted XML to Send to Bichard lambda.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has read access to internal incoming messages bucket (IAM Policy and Security Groups)\n- Check if lambda has access to Audit Log API (Security Groups)",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 46
      },
      "id": 41,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-send-to-bichard\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in Send to Bichard lambda",
        "name": "Send to Bichard lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 46
      },
      "id": 60,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-send-to-bichard\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 46
      },
      "id": 59,
      "options": {
        "content": "## Send to Bichard\nThis lambda transforms the XML structure to the format recognised by Bichard.\n\nThen it pushes the tranformed XML to `COURT_RESULT_INPUT_QUEUE` in Amazon MQ.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has access to AmazonMQ (Security Groups)\n- Check AmazonMQ instance health",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 54
      },
      "id": 36,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-record-sent-to-bichard-event\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in Record Sent to Bichard Event lambda",
        "name": "Record Sent to Bichard Event lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 54
      },
      "id": 62,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-record-sent-to-bichard-event\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 54
      },
      "id": 61,
      "options": {
        "content": "## Record Sent to Bichard Event\nThis lambda creates an event against the audit log record in DynamoDB via Audit Log API indicating that the message has successfully been pushed to the Amazon MQ.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has access to Audit Log API (Security Groups)",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 62
      },
      "id": 64,
      "panels": [],
      "title": "Audit Logging - Event Handler",
      "type": "row"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 63
      },
      "id": 42,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-store-event\"}",
          "format": "table",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 63
      },
      "id": 69,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-store-event\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 63
      },
      "id": 49,
      "options": {
        "content": "## Store Event\nThis lambda function retrieves the event XML from S3 bucket and stores it in Audit Log DynamoDB table.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has read access to audit-log-events S3 bucket (IAM Policy and Security Groups)\n- Check if lambda has access to Audit Log API (Security Groups)",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 71
      },
      "id": 25,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-court-result-input-event-message.*\"}",
          "format": "table",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in Court Result Input Event Message Receiver",
        "name": "Court Result Input Event Message Receiver lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 71
      },
      "id": 72,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-court-result-input-event-message.*\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 71
      },
      "id": 71,
      "options": {
        "content": "## Court Result Input Event Message Receiver\nReceives messages from `COURT_RESULT_INPUT_QUEUE` in Amazon MQ.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check lambda's event source mapping for failures.\n- Check if lambda has write access to audit-log-events S3 bucket.",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 79
      },
      "id": 22,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-audit-event-message.*\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in Audit Event Message Receiver lambda",
        "name": "Audit Event Message Receiver lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 79
      },
      "id": 75,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-audit-event-message-receiver\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 79
      },
      "id": 74,
      "options": {
        "content": "## Audit Event Message Receiver\nReceives messages from `AUDIT_EVENT_QUEUE` in Amazon MQ.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check lambda's event source mapping for failures.\n- Check if lambda has write access to audit-log-events S3 bucket.",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 87
      },
      "id": 28,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-general-event-message.*\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in General Event Message Receiver lambda",
        "name": "General Event Message Receiver lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 87
      },
      "id": 77,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-general-event-message-receiver\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 87
      },
      "id": 76,
      "options": {
        "content": "## General Event Message Receiver\nReceives messages from `GENERAL_EVENT_QUEUE` in Amazon MQ.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check lambda's event source mapping for failures.\n- Check if lambda has write access to audit-log-events S3 bucket.",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 95
      },
      "id": 32,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-hearing-outcome-pnc-update-event-message.*\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in Hearing Outcome PNC Update Event Message Receiver lambda",
        "name": "Hearing Outcome PNC Update Event Message Receiver lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 95
      },
      "id": 79,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-hearing-outcome-pnc-update-event-message.*\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 95
      },
      "id": 78,
      "options": {
        "content": "## Hearing Outcome PNC Update Event\nReceives messages from `HEARING_OUTCOME_PNC_UPDATE_QUEUE` in Amazon MQ.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check lambda's event source mapping for failures.\n- Check if lambda has write access to audit-log-events S3 bucket.",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 103
      },
      "id": 31,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_invocations_sum{function_name=~\"bichard-7-.*-hearing-outcome-input-event-message.*\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in Hearing Outcome Input Event Message Receiver",
        "name": "Hearing Outcome Input Event Message Receiver lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 103
      },
      "id": 81,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_invocations_sum{function_name=~\"bichard-7-.*-hearing-outcome-input-event-message.*\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 103
      },
      "id": 80,
      "options": {
        "content": "## Hearing Outcome Input Event\nReceives messages from `HEARING_OUTCOME_INPUT_QUEUE` in Amazon MQ.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check lambda's event source mapping for failures.\n- Check if lambda has write access to audit-log-events S3 bucket.",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 111
      },
      "id": 35,
      "options": {
        "colorMode": "background",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "sum"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "auto"
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-pnc-update-request-event-message.*\"}",
          "format": "table",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "transparent": true,
      "type": "stat"
    },
    {
      "alert": {
        "alertRuleTags": {},
        "conditions": [
          {
            "evaluator": {
              "params": [
                0
              ],
              "type": "gt"
            },
            "operator": {
              "type": "and"
            },
            "query": {
              "params": [
                "A",
                "5m",
                "now"
              ]
            },
            "reducer": {
              "params": [],
              "type": "count"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "5m",
        "frequency": "1m",
        "handler": 1,
        "message": "Error in PNC Update Request Event Message Receiver",
        "name": "PNC Update Request Event Message Receiver lambda alert",
        "noDataState": "no_data",
        "notifications": []
      },
      "datasource": null,
      "description": "",
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
          "noValue": "-",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 111
      },
      "id": 70,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.5.2",
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "exemplar": false,
          "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-pnc-update-request-event-message-.*\"}",
          "format": "table",
          "instant": false,
          "interval": "",
          "legendFormat": "{{function_name}}",
          "range": true,
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "gt",
          "value": 0,
          "visible": true
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": null,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 111
      },
      "id": 73,
      "options": {
        "content": "## PNC Update Request Event Message Receiver\nReceives messages from `PNC_UPDATE_REQUEST_QUEUE` in Amazon MQ.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check lambda's event source mapping for failures.\n- Check if lambda has write access to audit-log-events S3 bucket.",
        "mode": "markdown"
      },
      "pluginVersion": "8.5.2",
      "type": "text"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 119
      },
      "id": 66,
      "panels": [
        {
          "datasource": null,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 32
          },
          "id": 30,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-get-messages\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "datasource": null,
          "description": "",
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 32
          },
          "id": 87,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-get-messages\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 32
          },
          "id": 82,
          "options": {
            "content": "## Get Messages\nThis lambda fetches messages from audit-log and audit-log-lookup DynamoDB tables.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has access to audit-log and audit-log-lookup tables. (IAM Policy)\n- Check if lambda has access to DynamoDB (Security Groups)",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 40
          },
          "id": 29,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-get-events\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "datasource": null,
          "description": "",
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 40
          },
          "id": 88,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-get-events\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 40
          },
          "id": 83,
          "options": {
            "content": "## Get Events\nThis lambda fetches events of a message from audit-log and audit-log-lookup DynamoDB tables.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has access to audit-log and audit-log-lookup tables. (IAM Policy)\n- Check if lambda has access to DynamoDB (Security Groups)",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 48
          },
          "id": 26,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-create-audit-log\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "datasource": null,
          "description": "",
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 48
          },
          "id": 89,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-create-audit-log\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 48
          },
          "id": 84,
          "options": {
            "content": "## Create Audit Log\nThis lambda creates an Audit Log record in audit-log DynamoDB tables.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has access to audit-log tables. (IAM Policy)\n- Check if lambda has access to DynamoDB (Security Groups)",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 56
          },
          "id": 27,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-create-audit-log-event\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "datasource": null,
          "description": "",
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 56
          },
          "id": 90,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-create-audit-log-event\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 56
          },
          "id": 85,
          "options": {
            "content": "## Create Audit Log Event\nThis lambda creates an Audit Log Event against an existing Audit Log record in audit-log DynamoDB tables.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has access to audit-log and audit-log-lookup tables. (IAM Policy)\n- Check if lambda has access to DynamoDB (Security Groups)",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 64
          },
          "id": 40,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-sanitise-message\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "datasource": null,
          "description": "",
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 64
          },
          "id": 92,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-sanitise-message\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 64
          },
          "id": 86,
          "options": {
            "content": "## Sanitise Message\nThis lambda removes Personally Identifiable Information from both Audit Log record in DynamoDB and PostgresDB.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has access to audit-log and audit-log-lookup tables. (IAM Policy)\n- Check if lambda has access to DynamoDB (Security Groups)\n- Check if lambda has access to PostgresDB (Security Groups)\n- Check if environment variables for PostgresDB are correct. (Credentials, DB name, etc)\n- Check PostgresDB health.",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 72
          },
          "id": 39,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-retry-message\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "datasource": null,
          "description": "",
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 72
          },
          "id": 93,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-retry-message\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 72
          },
          "id": 91,
          "options": {
            "content": "## Retry Message\nThis lambda retries a failed Audit Log record. Failed Audit Logs are records that have received events from one of the Amazon MQ failure queues.\n\n### Troubleshooting\n- Check cloudwatch logs\n- Check if lambda has access to audit-log and audit-log-lookup tables. (IAM Policy)\n- Check if lambda has access to DynamoDB (Security Groups)\n- Check if lambda has access to Amazon MQ (Security Groups)",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        }
      ],
      "title": "Audit Log API",
      "type": "row"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 120
      },
      "id": 68,
      "panels": [
        {
          "datasource": null,
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 33
          },
          "id": 24,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-common-platform-report\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 33
          },
          "id": 95,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-common-platform-report\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 33
          },
          "id": 94,
          "options": {
            "content": "## Common Platform Report",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 41
          },
          "id": 44,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-top-exceptions-report\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 41
          },
          "id": 99,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-top-exceptions-report\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 41
          },
          "id": 96,
          "options": {
            "content": "## Top Exceptions Report",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 49
          },
          "id": 23,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-automation-report\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 49
          },
          "id": 100,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-automation-report\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 49
          },
          "id": 97,
          "options": {
            "content": "## Automation Report",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 57
          },
          "id": 34,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-mps-report\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 57
          },
          "id": 101,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-mps-report\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 57
          },
          "id": 98,
          "options": {
            "content": "## MPS Report",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        }
      ],
      "title": "Reporting",
      "type": "row"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 121
      },
      "id": 18,
      "panels": [
        {
          "datasource": null,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "0",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 34
          },
          "id": 20,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=\"bichard-7-.*-add-archival-events\"}",
              "format": "time_series",
              "instant": false,
              "interval": "0",
              "legendFormat": "Add archival events",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "alert": {
            "alertRuleTags": {},
            "conditions": [
              {
                "evaluator": {
                  "params": [
                    0
                  ],
                  "type": "gt"
                },
                "operator": {
                  "type": "and"
                },
                "query": {
                  "params": [
                    "A",
                    "5m",
                    "now"
                  ]
                },
                "reducer": {
                  "params": [],
                  "type": "count"
                },
                "type": "query"
              }
            ],
            "executionErrorState": "alerting",
            "for": "5m",
            "frequency": "1m",
            "handler": 1,
            "message": "Error in Add Archival Event lambda",
            "name": "Add Archival Event lambda alert",
            "noDataState": "no_data",
            "notifications": []
          },
          "datasource": null,
          "description": "",
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
              "noValue": "0",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 34
          },
          "id": 103,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=\"bichard-7-.*-add-archival-events\"}",
              "format": "time_series",
              "instant": false,
              "interval": "0",
              "legendFormat": "Add archival events",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [
            {
              "colorMode": "critical",
              "op": "gt",
              "value": 0,
              "visible": true
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 34
          },
          "id": 102,
          "options": {
            "content": "## Add Archival Events",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 42
          },
          "id": 21,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-archive-user-logs\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "alert": {
            "alertRuleTags": {},
            "conditions": [
              {
                "evaluator": {
                  "params": [
                    0
                  ],
                  "type": "gt"
                },
                "operator": {
                  "type": "and"
                },
                "query": {
                  "params": [
                    "A",
                    "5m",
                    "now"
                  ]
                },
                "reducer": {
                  "params": [],
                  "type": "count"
                },
                "type": "query"
              }
            ],
            "executionErrorState": "alerting",
            "for": "5m",
            "frequency": "1m",
            "handler": 1,
            "message": "Error in Archive User Logs lambda",
            "name": "Archive User Logs lambda alert",
            "noDataState": "no_data",
            "notifications": []
          },
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 42
          },
          "id": 108,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-archive-user-logs\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [
            {
              "colorMode": "critical",
              "op": "gt",
              "value": 0,
              "visible": true
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 42
          },
          "id": 104,
          "options": {
            "content": "## Archive User Logs",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 50
          },
          "id": 38,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-retry-failed-messages\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "alert": {
            "alertRuleTags": {},
            "conditions": [
              {
                "evaluator": {
                  "params": [
                    0
                  ],
                  "type": "gt"
                },
                "operator": {
                  "type": "and"
                },
                "query": {
                  "params": [
                    "A",
                    "5m",
                    "now"
                  ]
                },
                "reducer": {
                  "params": [],
                  "type": "count"
                },
                "type": "query"
              }
            ],
            "executionErrorState": "alerting",
            "for": "5m",
            "frequency": "1m",
            "handler": 1,
            "message": "Error in Retry Failed Messages lambda",
            "name": "Retry Failed Messages lambda alert",
            "noDataState": "no_data",
            "notifications": []
          },
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 50
          },
          "id": 109,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-retry-failed-messages\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [
            {
              "colorMode": "critical",
              "op": "gt",
              "value": 0,
              "visible": true
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 50
          },
          "id": 105,
          "options": {
            "content": "## Retry Failed Messages",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 58
          },
          "id": 37,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-resubmit-pnc-failures\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "alert": {
            "alertRuleTags": {},
            "conditions": [
              {
                "evaluator": {
                  "params": [
                    0
                  ],
                  "type": "gt"
                },
                "operator": {
                  "type": "and"
                },
                "query": {
                  "params": [
                    "A",
                    "5m",
                    "now"
                  ]
                },
                "reducer": {
                  "params": [],
                  "type": "count"
                },
                "type": "query"
              }
            ],
            "executionErrorState": "alerting",
            "for": "5m",
            "frequency": "1m",
            "handler": 1,
            "message": "Error in Resubmit PNC failures lambda",
            "name": "Resubmit PNC failures lambda alert",
            "noDataState": "no_data",
            "notifications": []
          },
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 58
          },
          "id": 110,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-resubmit-pnc-failures\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [
            {
              "colorMode": "critical",
              "op": "gt",
              "value": 0,
              "visible": true
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 58
          },
          "id": 106,
          "options": {
            "content": "## Resubmit PNC Failures",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        },
        {
          "datasource": null,
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 4,
            "x": 0,
            "y": 66
          },
          "id": 33,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "sum"
              ],
              "fields": "",
              "values": false
            },
            "text": {},
            "textMode": "value"
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-maintenance-page\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "transparent": true,
          "type": "stat"
        },
        {
          "alert": {
            "alertRuleTags": {},
            "conditions": [
              {
                "evaluator": {
                  "params": [
                    0
                  ],
                  "type": "gt"
                },
                "operator": {
                  "type": "and"
                },
                "query": {
                  "params": [
                    "A",
                    "5m",
                    "now"
                  ]
                },
                "reducer": {
                  "params": [],
                  "type": "count"
                },
                "type": "query"
              }
            ],
            "executionErrorState": "alerting",
            "for": "5m",
            "frequency": "1m",
            "handler": 1,
            "message": "Error in Maintenance Page lambda",
            "name": "Maintenance Page lambda alert",
            "noDataState": "no_data",
            "notifications": []
          },
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
              "noValue": "-",
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 4,
            "y": 66
          },
          "id": 111,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom"
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "8.5.2",
          "targets": [
            {
              "datasource": null,
              "editorMode": "code",
              "exemplar": false,
              "expr": "aws_lambda_errors_sum{function_name=~\"bichard-7-.*-maintenance-page\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{function_name}}",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [
            {
              "colorMode": "critical",
              "op": "gt",
              "value": 0,
              "visible": true
            }
          ],
          "type": "timeseries"
        },
        {
          "datasource": null,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 66
          },
          "id": 107,
          "options": {
            "content": "## Maintenance Page\nThis lambda function serves static content (html, images, css, and js) and used when we go under maintenance.\nThis is done by routing the main ALB traffic to this lambda function.\n\n### Troubleshooting\nThere is no integration or dependency in this lambda. So errors might be related to:\n\n- (Very rare) The requested URL in the lambda's payload is invalid and when converting it to a file path to read a file content inside the lambda, it throws error.\n- Rate exceeded error which happen when cannot be invoked because of the limit in total number of concurrent exections. Increasing the reserved concurrent executions of the lambda should fix the issue.\n\nSince we only use this lambda in rare scenarios where we need to prevent users' access to the whole system, the best to do is to check the cloudwatch logs.",
            "mode": "markdown"
          },
          "pluginVersion": "8.5.2",
          "type": "text"
        }
      ],
      "title": "Others",
      "type": "row"
    }
  ],
  "refresh": false,
  "schemaVersion": 36,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "2022-03-19T23:16:29.612Z",
    "to": "2022-07-09T23:16:29.612Z"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Bichard Lambdas Errors",
  "uid": "OqdK1Du7z",
  "version": 31,
  "weekStart": ""
}

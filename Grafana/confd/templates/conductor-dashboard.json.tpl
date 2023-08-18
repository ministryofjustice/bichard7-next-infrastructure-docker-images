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
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 199,
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
      "id": 22,
      "panels": [],
      "title": "Workflow and Task Metrics",
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
        "h": 8,
        "w": 18,
        "x": 0,
        "y": 1
      },
      "id": 14,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "task_queue_depth",
          "legendFormat": "{{"{{"}}taskType{{"}}"}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Task Queue Length",
      "type": "timeseries"
    },
    {
      "datasource": null,
      "description": "Time spent by a task in queue",
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
          "unit": "s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 9,
        "x": 0,
        "y": 9
      },
      "id": 18,
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
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "task_queue_wait_seconds_max",
          "legendFormat": "{{"{{"}}taskType{{"}}"}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Max Wait Time in Queue by Task Type",
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
        "h": 8,
        "w": 9,
        "x": 9,
        "y": 9
      },
      "id": 12,
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
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "workflow_running{}",
          "legendFormat": "{{"{{"}}workflowName{{"}}"}}",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": null,
          "hide": false,
          "refId": "B"
        }
      ],
      "title": "Number of Running Workflows",
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
        "h": 8,
        "w": 9,
        "x": 0,
        "y": 17
      },
      "id": 16,
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
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "workflow_failure_total",
          "legendFormat": "{{"{{"}}workflowName{{"}}"}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Number of Workflow Failures",
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
          "unit": "s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 9,
        "x": 9,
        "y": 17
      },
      "id": 10,
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
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "workflow_execution_seconds_max",
          "legendFormat": "{{"{{"}}workflowName{{"}}"}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Max Workflow Duration",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 25
      },
      "id": 20,
      "panels": [],
      "title": "AWS ECS Usage",
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
                "color": "green"
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
        "h": 8,
        "w": 9,
        "x": 0,
        "y": 26
      },
      "id": 6,
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
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_cpuutilization_maximum{service_name=\"cjse-production-bichard-7-conductor-core-worker\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Max)",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_cpuutilization_average{service_name=\"cjse-production-bichard-7-conductor-core-worker\"}",
          "interval": "",
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Average)",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_cpuutilization_minimum{service_name=\"cjse-production-bichard-7-conductor-core-worker\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Min)",
          "range": true,
          "refId": "C"
        }
      ],
      "title": "CPU Utilisation: Conductor Worker",
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
                "color": "green"
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
        "h": 8,
        "w": 9,
        "x": 9,
        "y": 26
      },
      "id": 8,
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
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_memory_utilization_average{service_name=\"cjse-production-bichard-7-conductor-core-worker\"}",
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Average)",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_memory_utilization_maximum{service_name=\"cjse-production-bichard-7-conductor-core-worker\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Max)",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_memory_utilization_minimum{service_name=\"cjse-production-bichard-7-conductor-core-worker\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Min)",
          "range": true,
          "refId": "C"
        }
      ],
      "title": "Memory Utilisation: Conductor Worker",
      "type": "timeseries"
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
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
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
        "w": 9,
        "x": 0,
        "y": 34
      },
      "id": 4,
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
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_cpuutilization_average{service_name=\"cjse-production-bichard-7-conductor\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Average)",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_cpuutilization_maximum{service_name=\"cjse-production-bichard-7-conductor\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Max)",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_cpuutilization_minimum{service_name=\"cjse-production-bichard-7-conductor\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Min)",
          "range": true,
          "refId": "C"
        }
      ],
      "title": "CPU Utilisation: Conductor Server",
      "type": "timeseries"
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
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
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
        "w": 9,
        "x": 9,
        "y": 34
      },
      "id": 2,
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
      "targets": [
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_memory_utilization_average{service_name=\"cjse-production-bichard-7-conductor\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Average)",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_memory_utilization_maximum{service_name=\"cjse-production-bichard-7-conductor\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Max)",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": null,
          "editorMode": "code",
          "expr": "aws_ecs_memory_utilization_minimum{service_name=\"cjse-production-bichard-7-conductor\"}",
          "hide": false,
          "legendFormat": "{{"{{"}}serviceName{{"}}"}} (Min)",
          "range": true,
          "refId": "C"
        }
      ],
      "title": "Memory Utilisation: Conductor Server",
      "type": "timeseries"
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
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Conductor",
  "uid": "X8ztTteVk",
  "version": 8,
  "weekStart": ""
}
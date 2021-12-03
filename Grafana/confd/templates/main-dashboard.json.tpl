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
      "id": 17,
      "panels": [],
      "title": "Rate of Statuses",
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
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "#EAB839",
                "value": 1000
              },
              {
                "color": "red",
                "value": 2500
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 0,
        "y": 1
      },
      "id": 22,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "auto"
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "sum(aws_applicationelb_httpcode_target_2_xx_count_sample_count{load_balancer=\"app/cjse-e2e-test-bichard-7-nginx-au/c58ca3284d27c318\"})",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "2xx Hits",
      "type": "stat"
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
                "color": "#EAB839",
                "value": 500
              },
              {
                "color": "red",
                "value": 1000
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 6,
        "y": 1
      },
      "id": 23,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "auto"
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "sum(aws_applicationelb_httpcode_target_3_xx_count_sample_count{load_balancer=\"app/cjse-e2e-test-bichard-7-nginx-au/c58ca3284d27c318\"})",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "3xx Hits",
      "type": "stat"
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
                "color": "#EAB839",
                "value": 10
              },
              {
                "color": "red",
                "value": 100
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 12,
        "y": 1
      },
      "id": 25,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "auto"
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "sum(aws_applicationelb_httpcode_target_4_xx_count_sample_count{load_balancer=\"app/cjse-e2e-test-bichard-7-nginx-au/c58ca3284d27c318\"})",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "4xx Hits",
      "type": "stat"
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
                "color": "#EAB839",
                "value": 10
              },
              {
                "color": "red",
                "value": 100
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 18,
        "y": 1
      },
      "id": 27,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "auto"
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "sum(aws_applicationelb_httpcode_target_5_xx_count_sample_count{load_balancer=\"app/cjse-e2e-test-bichard-7-nginx-au/c58ca3284d27c318\"})",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "5xx Hits",
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
            "drawStyle": "bars",
            "fillOpacity": 100,
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
              "mode": "normal"
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
              "options": "2xx Hits"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "green",
                  "mode": "fixed"
                }
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "3xx Hits"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "blue",
                  "mode": "fixed"
                }
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "4xx Hits"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "orange",
                  "mode": "fixed"
                }
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 8,
        "w": 24,
        "x": 0,
        "y": 9
      },
      "id": 19,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi"
        }
      },
      "targets": [
        {
          "exemplar": true,
          "expr": "sum(aws_applicationelb_httpcode_target_2_xx_count_sample_count{load_balancer=\"app/cjse-e2e-test-bichard-7-nginx-au/c58ca3284d27c318\"})",
          "interval": "",
          "legendFormat": "2xx Hits",
          "refId": "A"
        },
        {
          "exemplar": true,
          "expr": "sum(aws_applicationelb_httpcode_target_3_xx_count_sample_count{load_balancer=\"app/cjse-e2e-test-bichard-7-nginx-au/c58ca3284d27c318\"})",
          "hide": false,
          "interval": "",
          "legendFormat": "3xx Hits",
          "refId": "B"
        },
        {
          "exemplar": true,
          "expr": "sum(aws_applicationelb_httpcode_target_4_xx_count_sample_count{load_balancer=\"app/cjse-e2e-test-bichard-7-nginx-au/c58ca3284d27c318\"})",
          "hide": false,
          "interval": "",
          "legendFormat": "4xx Hits",
          "refId": "C"
        },
        {
          "exemplar": true,
          "expr": "sum(aws_applicationelb_httpcode_target_5_xx_count_sample_count{load_balancer=\"app/cjse-e2e-test-bichard-7-nginx-au/c58ca3284d27c318\"})",
          "hide": false,
          "interval": "",
          "legendFormat": "5xx Hits",
          "refId": "D"
        }
      ],
      "title": "Status Hits Nginx Auth",
      "type": "timeseries"
    },
    {
      "collapsed": true,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 17
      },
      "id": 9,
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
        }
      ],
      "title": "Queues",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": null,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 18
      },
      "id": 7,
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
            "y": 2
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
            "y": 2
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
      "title": "Bichard",
      "type": "row"
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
  "uid": "Sh6172pnz",
  "version": 1
}
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
  "description": "Quick overview of values from blackbox exporters",
  "editable": true,
  "gnetId": 11529,
  "graphTooltip": 0,
  "id": 4,
  "iteration": 1638972909241,
  "links": [],
  "panels": [
    {
      "columns": [],
      "datasource": null,
      "fontSize": "100%",
      "gridPos": {
        "h": 7,
        "w": 10,
        "x": 0,
        "y": 0
      },
      "id": 103,
      "links": [],
      "pageSize": null,
      "repeat": null,
      "repeatDirection": "h",
      "scroll": true,
      "showHeader": true,
      "sort": {
        "col": 4,
        "desc": false
      },
      "styles": [
        {
          "alias": "Time",
          "align": "auto",
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "pattern": "Time",
          "type": "hidden"
        },
        {
          "alias": "1=UP, 0=DOWN",
          "align": "auto",
          "colorMode": "row",
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(245, 54, 54, 0.9)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 0,
          "pattern": "Value",
          "thresholds": [
            "0",
            "1"
          ],
          "type": "number",
          "unit": "short"
        },
        {
          "alias": "",
          "align": "auto",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "__name__",
          "thresholds": [],
          "type": "hidden",
          "unit": "short"
        },
        {
          "alias": "",
          "align": "auto",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "decimals": 2,
          "pattern": "/.*/",
          "thresholds": [],
          "type": "number",
          "unit": "short"
        }
      ],
      "targets": [
        {
          "expr": "probe_success",
          "format": "table",
          "instant": true,
          "intervalFactor": 1,
          "refId": "A"
        }
      ],
      "title": "Endpoint Probes (Up/Down) - Current",
      "transform": "table",
      "type": "table-old"
    },
    {
      "alert": {
        "alertRuleTags": {
          "service": "Alert Manager",
          "severity": "critical"
        },
        "conditions": [
          {
            "evaluator": {
              "params": [
                1
              ],
              "type": "lt"
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
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "3m",
        "frequency": "1m",
        "handler": 1,
        "message": "Endpoint probe is not responding",
        "name": "Endpoint Probes Down",
        "noDataState": "keep_state",
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
            "axisPlacement": "hidden",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "stepAfter",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "decimals": 0,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "transparent",
                "value": 0
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 14,
        "x": 10,
        "y": 0
      },
      "id": 111,
      "links": [],
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "probe_success{instance=\"https://alerts.{{getv "/cjse/infra/domain" "cjse.org"}}\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "lt",
          "value": 1,
          "visible": true
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Alert Manager (Up/Down) - Historic",
      "type": "timeseries"
    },
    {
      "alert": {
        "alertRuleTags": {
          "service": "Audit Logging",
          "severity": "critical"
        },
        "conditions": [
          {
            "evaluator": {
              "params": [
                1
              ],
              "type": "lt"
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
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "3m",
        "frequency": "1m",
        "handler": 1,
        "message": "Endpoint probe is not responding",
        "name": "Endpoint Probes Down",
        "noDataState": "keep_state",
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
            "axisPlacement": "hidden",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "stepAfter",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "decimals": 0,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "transparent",
                "value": 0
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 14,
        "x": 10,
        "y": 0
      },
      "id": 111,
      "links": [],
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "probe_success{instance=\"https://audit.{{getv "/cjse/infra/domain" "cjse.org"}}\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "lt",
          "value": 1,
          "visible": true
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Audit Logging(Up/Down) - Historic",
      "type": "timeseries"
    },
    {
      "alert": {
        "alertRuleTags": {
          "service": "Bichard Web Frontend",
          "severity": "critical"
        },
        "conditions": [
          {
            "evaluator": {
              "params": [
                1
              ],
              "type": "lt"
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
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "3m",
        "frequency": "1m",
        "handler": 1,
        "message": "Endpoint probe is not responding",
        "name": "Endpoint Probes Down",
        "noDataState": "keep_state",
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
            "axisPlacement": "hidden",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "stepAfter",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "decimals": 0,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "transparent",
                "value": 0
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 14,
        "x": 10,
        "y": 0
      },
      "id": 111,
      "links": [],
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "probe_success{instance=\"https://bichard-web.{{getv "/cjse/infra/domain" "cjse.org"}}\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "lt",
          "value": 1,
          "visible": true
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bichard Web Front End (Up/Down) - Historic",
      "type": "timeseries"
    },
    {
      "alert": {
        "alertRuleTags": {
          "service": "Elasticsearch",
          "severity": "critical"
        },
        "conditions": [
          {
            "evaluator": {
              "params": [
                1
              ],
              "type": "lt"
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
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "3m",
        "frequency": "1m",
        "handler": 1,
        "message": "Endpoint probe is not responding",
        "name": "Endpoint Probes Down",
        "noDataState": "keep_state",
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
            "axisPlacement": "hidden",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "stepAfter",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "decimals": 0,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "transparent",
                "value": 0
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 14,
        "x": 10,
        "y": 0
      },
      "id": 111,
      "links": [],
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "probe_success{instance=\"https://elasticsearch.{{getv "/cjse/infra/domain" "cjse.org"}}\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "lt",
          "value": 1,
          "visible": true
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Elasticsearch (Up/Down) - Historic",
      "type": "timeseries"
    },{
      "alert": {
        "alertRuleTags": {
          "service": "Prometheus",
          "severity": "critical"
        },
        "conditions": [
          {
            "evaluator": {
              "params": [
                1
              ],
              "type": "lt"
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
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "3m",
        "frequency": "1m",
        "handler": 1,
        "message": "Endpoint probe is not responding",
        "name": "Endpoint Probes Down",
        "noDataState": "keep_state",
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
            "axisPlacement": "hidden",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "stepAfter",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "decimals": 0,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "transparent",
                "value": 0
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 14,
        "x": 10,
        "y": 0
      },
      "id": 111,
      "links": [],
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "probe_success{instance=\"https://prometheus.{{getv "/cjse/infra/domain" "cjse.org"}}\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "lt",
          "value": 1,
          "visible": true
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Prometheus (Up/Down) - Historic",
      "type": "timeseries"
    },
    {
      "alert": {
        "alertRuleTags": {
          "service": "Grafana",
          "severity": "critical"
        },
        "conditions": [
          {
            "evaluator": {
              "params": [
                1
              ],
              "type": "lt"
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
              "type": "avg"
            },
            "type": "query"
          }
        ],
        "executionErrorState": "alerting",
        "for": "3m",
        "frequency": "1m",
        "handler": 1,
        "message": "Endpoint probe is not responding",
        "name": "Endpoint Probes Down",
        "noDataState": "keep_state",
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
            "axisPlacement": "hidden",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "stepAfter",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "decimals": 0,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "transparent",
                "value": 0
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 14,
        "x": 10,
        "y": 0
      },
      "id": 111,
      "links": [],
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "pluginVersion": "8.0.5",
      "targets": [
        {
          "exemplar": true,
          "expr": "probe_success{instance=\"https://grafana.{{getv "/cjse/infra/domain" "cjse.org"}}\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "op": "lt",
          "value": 1,
          "visible": true
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Grafana (Up/Down) - Historic",
      "type": "timeseries"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 6,
        "w": 14,
        "x": 10,
        "y": 6
      },
      "hiddenSeries": false,
      "id": 107,
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.0.5",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "probe_dns_lookup_time_seconds",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "DNS Lookup",
      "tooltip": {
        "shared": true,
        "sort": 2,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "columns": [],
      "datasource": null,
      "fontSize": "100%",
      "gridPos": {
        "h": 6,
        "w": 10,
        "x": 0,
        "y": 7
      },
      "id": 109,
      "links": [],
      "pageSize": null,
      "scroll": true,
      "showHeader": true,
      "sort": {
        "col": 3,
        "desc": false
      },
      "styles": [
        {
          "alias": "Time",
          "align": "auto",
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "pattern": "Time",
          "type": "hidden"
        },
        {
          "alias": "Time Left",
          "align": "auto",
          "colorMode": "row",
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 0,
          "pattern": "Value",
          "thresholds": [
            "0",
            "2592000"
          ],
          "type": "number",
          "unit": "s"
        },
        {
          "alias": "",
          "align": "auto",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "decimals": 2,
          "pattern": "/.*/",
          "thresholds": [],
          "type": "number",
          "unit": "short"
        }
      ],
      "targets": [
        {
          "expr": "probe_ssl_earliest_cert_expiry-time()",
          "format": "table",
          "instant": true,
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "title": "SSL Cert Expiry",
      "transform": "table",
      "type": "table-old"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": null,
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 13
      },
      "hiddenSeries": false,
      "id": 105,
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.0.5",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "probe_duration_seconds",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": ""{{"{{instance}}"}}"",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Probe Duration",
      "tooltip": {
        "shared": true,
        "sort": 2,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    }
  ],
  "refresh": "30s",
  "schemaVersion": 30,
  "style": "dark",
  "tags": [
    "blackbox",
    "prometheus"
  ],
  "templating": {
    "list": [
      {
        "auto": true,
        "auto_count": 10,
        "auto_min": "10s",
        "current": {
          "selected": false,
          "text": "auto",
          "value": "$__auto_interval_interval"
        },
        "description": null,
        "error": null,
        "hide": 2,
        "label": "Interval",
        "name": "interval",
        "options": [
          {
            "selected": true,
            "text": "auto",
            "value": "$__auto_interval_interval"
          },
          {
            "selected": false,
            "text": "5s",
            "value": "5s"
          },
          {
            "selected": false,
            "text": "10s",
            "value": "10s"
          },
          {
            "selected": false,
            "text": "30s",
            "value": "30s"
          },
          {
            "selected": false,
            "text": "1m",
            "value": "1m"
          },
          {
            "selected": false,
            "text": "10m",
            "value": "10m"
          },
          {
            "selected": false,
            "text": "30m",
            "value": "30m"
          },
          {
            "selected": false,
            "text": "1h",
            "value": "1h"
          },
          {
            "selected": false,
            "text": "6h",
            "value": "6h"
          },
          {
            "selected": false,
            "text": "12h",
            "value": "12h"
          },
          {
            "selected": false,
            "text": "1d",
            "value": "1d"
          },
          {
            "selected": false,
            "text": "7d",
            "value": "7d"
          },
          {
            "selected": false,
            "text": "14d",
            "value": "14d"
          },
          {
            "selected": false,
            "text": "30d",
            "value": "30d"
          }
        ],
        "query": "5s,10s,30s,1m,10m,30m,1h,6h,12h,1d,7d,14d,30d",
        "refresh": 2,
        "skipUrlSync": false,
        "type": "interval"
      },
      {
        "allValue": null,
        "current": {
          "selected": false,
          "text": "All",
          "value": "$__all"
        },
        "datasource": null,
        "definition": "",
        "description": null,
        "error": null,
        "hide": 2,
        "includeAll": true,
        "label": null,
        "multi": true,
        "name": "targets",
        "options": [],
        "query": {
          "query": "label_values(probe_success, instance)",
          "refId": "Prometheus-targets-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-15m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Bichard7 Endpoint Statuses",
  "uid": "L4BnVlcnz",
  "version": 1
}

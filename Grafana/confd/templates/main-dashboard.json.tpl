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
            "title": "Web Activity",
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
                        "drawStyle": "bars",
                        "fillOpacity": 100,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "linear",
                        "lineStyle": {
                            "fill": "solid"
                        },
                        "lineWidth": 0,
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
                            "mode": "off"
                        }
                    },
                    "mappings": [],
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
                                "value": 80
                            }
                        ]
                    }
                },
                "overrides": []
            },
            "gridPos": {
                "h": 8,
                "w": 11,
                "x": 0,
                "y": 1
            },
            "id": 36,
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
                    "expr": "logmetrics_user_login_events_sum{}",
                    "instant": false,
                    "interval": "",
                    "intervalFactor": 1,
                    "legendFormat": "",
                    "refId": "A"
                }
            ],
            "alert": {
                "conditions": [
                    {
                        "type": "query",
                        "query": {
                            "params": [
                                "A",
                                "24h",
                                "now"
                            ]
                        },
                        "reducer": {
                            "type": "count",
                            "params": []
                        },
                        "evaluator": {
                            "type": "lt",
                            "params": [
                                1
                            ]
                        },
                        "operator": {
                            "type": "and"
                        }
                    }
                ],
                "noDataState": "no_data",
                "executionErrorState": "alerting",
                "frequency": "15m",
                "handler": 1,
                "notifications": [],
                "for": "24h",
                "alertRuleTags": {},
                "name": "User Login Events alert",
                "message": "We haven't seen any logins for the past 24 hours, this is unusual."
            },
            "title": "User Login Events",
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
                        "drawStyle": "bars",
                        "fillOpacity": 100,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "stepBefore",
                        "lineWidth": 0,
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
                            "options": "sum(rate(aws_applicationelb_httpcode_target_2_xx_count_sum{load_balancer=~\".*-bichard-7-nginx/.*\"}[1m]))"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "200 Response"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "sum(rate(aws_applicationelb_httpcode_target_3_xx_count_sum{load_balancer=~\".*-bichard-7-nginx/.*\"}[1m]))"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "300 Response"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "sum(rate(aws_applicationelb_httpcode_target_4_xx_count_sum{load_balancer=~\".*-bichard-7-nginx/.*\"}[1m]))"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "400 Response"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "sum(rate(aws_applicationelb_httpcode_target_5_xx_count_sum{load_balancer=~\".*-bichard-7-nginx/.*\"}[1m]))"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "500 Response"
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 8,
                "w": 11,
                "x": 11,
                "y": 1
            },
            "id": 38,
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
                    "expr": "sum(rate(aws_applicationelb_httpcode_target_2_xx_count_sum{load_balancer=~\".*-bichard-7-nginx/.*\"}[$__interval]))",
                    "interval": "",
                    "legendFormat": "",
                    "refId": "A"
                },
                {
                    "exemplar": true,
                    "expr": "sum(rate(aws_applicationelb_httpcode_target_3_xx_count_sum{load_balancer=~\".*-bichard-7-nginx/.*\"}[$__interval]))",
                    "hide": false,
                    "interval": "",
                    "legendFormat": "",
                    "refId": "B"
                },
                {
                    "exemplar": true,
                    "expr": "sum(rate(aws_applicationelb_httpcode_target_4_xx_count_sum{load_balancer=~\".*-bichard-7-nginx/.*\"}[$__interval]))",
                    "hide": false,
                    "interval": "",
                    "legendFormat": "",
                    "refId": "C"
                },
                {
                    "exemplar": true,
                    "expr": "sum(rate(aws_applicationelb_httpcode_target_5_xx_count_sum{load_balancer=~\".*-bichard-7-nginx/.*\"}[$__interval]))",
                    "hide": false,
                    "interval": "",
                    "intervalFactor": 1,
                    "legendFormat": "",
                    "refId": "D"
                }
            ],
            "title": "HTTP Response Codes",
            "type": "timeseries"
        },
        {
            "collapsed": false,
            "datasource": null,
            "gridPos": {
                "h": 1,
                "w": 24,
                "x": 0,
                "y": 9
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
                        "drawStyle": "bars",
                        "fillOpacity": 100,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "linear",
                        "lineWidth": 0,
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
                "y": 10
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
                "y": 10
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
                    "expr": "aws_amazonmq_queue_size_sum{}",
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
                "y": 16
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
                "y": 16
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
                    "expr": "aws_amazonmq_consumer_count_sum{}",
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
                "y": 22
            },
            "id": 40,
            "panels": [],
            "title": "PNC",
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
                        "drawStyle": "bars",
                        "fillOpacity": 100,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "linear",
                        "lineWidth": 0,
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
                                "value": 80
                            }
                        ]
                    }
                },
                "overrides": [
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "logmetrics_pncconnection_error_events_sum{job=\"logmetrics\"}"
                        },
                        "properties": [
                            {
                                "id": "color",
                                "value": {
                                    "fixedColor": "dark-red",
                                    "mode": "fixed"
                                }
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 7,
                "w": 11,
                "x": 0,
                "y": 23
            },
            "id": 42,
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
                    "expr": "logmetrics_pncconnection_error_events_sum{}",
                    "interval": "",
                    "legendFormat": "",
                    "refId": "A"
                }
            ],
            "title": "PNC Errors",
            "type": "timeseries"
        },
        {
            "collapsed": false,
            "datasource": null,
            "gridPos": {
                "h": 1,
                "w": 24,
                "x": 0,
                "y": 30
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
                            "id": "byRegexp",
                            "options": ".*-web.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Web"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byRegexp",
                            "options": ".*-backend.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Backend"
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 6,
                "w": 11,
                "x": 0,
                "y": 31
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
                    "expr": "aws_ecs_cpuutilization_average{service_name=~\"cjse-bichard7-.*-base-infra-.*\"}",
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
                            "id": "byRegexp",
                            "options": ".*-web.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Web"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byRegexp",
                            "options": ".*-backend.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Backend"
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 6,
                "w": 11,
                "x": 11,
                "y": 31
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
                    "expr": "aws_ecs_memory_utilization_average{service_name=~\"cjse-bichard7-.*-base-infra-.*\"}",
                    "interval": "",
                    "legendFormat": "",
                    "refId": "A"
                }
            ],
            "title": "Bichard Memory",
            "type": "timeseries"
        },
        {
            "collapsed": false,
            "datasource": null,
            "gridPos": {
                "h": 1,
                "w": 24,
                "x": 0,
                "y": 37
            },
            "id": 31,
            "panels": [],
            "title": "State Machines",
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
                        "drawStyle": "bars",
                        "fillOpacity": 100,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "linear",
                        "lineWidth": 0,
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
                            "id": "byRegexp",
                            "options": ".*_throttled.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Throttled"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byRegexp",
                            "options": ".*_aborted.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Aborted"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byRegexp",
                            "options": ".*_failed.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Failed"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byRegexp",
                            "options": ".*_timed_out.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Timed Out"
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 7,
                "w": 11,
                "x": 0,
                "y": 38
            },
            "id": 44,
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
                    "expr": "aws_states_execution_throttled_sum{state_machine_arn=~\".*-incoming-message-handler\"}",
                    "interval": "",
                    "legendFormat": "",
                    "refId": "A"
                },
                {
                    "exemplar": true,
                    "expr": "aws_states_executions_aborted_sum{state_machine_arn=~\".*-incoming-message-handler\"}",
                    "hide": false,
                    "interval": "",
                    "legendFormat": "",
                    "refId": "B"
                },
                {
                    "exemplar": true,
                    "expr": "aws_states_executions_failed_sum{state_machine_arn=~\".*-incoming-message-handler\"}",
                    "hide": false,
                    "interval": "",
                    "legendFormat": "",
                    "refId": "C"
                },
                {
                    "exemplar": true,
                    "expr": "aws_states_executions_timed_out_sum{state_machine_arn=~\".*-incoming-message-handler\"}",
                    "hide": false,
                    "interval": "",
                    "legendFormat": "",
                    "refId": "D"
                }
            ],
            "title": "Incoming Message Handler Failures",
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
                        "drawStyle": "bars",
                        "fillOpacity": 100,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "linear",
                        "lineWidth": 0,
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
                            "id": "byRegexp",
                            "options": ".*_throttled.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Throttled"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byRegexp",
                            "options": ".*_aborted.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Aborted"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byRegexp",
                            "options": ".*_failed.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Failed"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byRegexp",
                            "options": ".*_timed_out.*"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "Timed Out"
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 7,
                "w": 11,
                "x": 11,
                "y": 38
            },
            "id": 45,
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
                    "expr": "aws_states_execution_throttled_sum{state_machine_arn=~\".*-event-handler\"}",
                    "interval": "",
                    "legendFormat": "",
                    "refId": "A"
                },
                {
                    "exemplar": true,
                    "expr": "aws_states_executions_aborted_sum{state_machine_arn=~\".*-event-handler\"}",
                    "hide": false,
                    "interval": "",
                    "legendFormat": "",
                    "refId": "B"
                },
                {
                    "exemplar": true,
                    "expr": "aws_states_executions_failed_sum{state_machine_arn=~\".*-event-handler\"}",
                    "hide": false,
                    "interval": "",
                    "legendFormat": "",
                    "refId": "C"
                },
                {
                    "exemplar": true,
                    "expr": "aws_states_executions_timed_out_sum{state_machine_arn=~\".*-event-handler\"}",
                    "hide": false,
                    "interval": "",
                    "legendFormat": "",
                    "refId": "D"
                }
            ],
            "title": "Event Handler Failures",
            "type": "timeseries"
        },
        {
          "id": 47,
          "gridPos": {
            "x": 0,
            "y": 0,
            "w": 12,
            "h": 8
          },
          "type": "timeseries",
          "title": "Web response time(response time from nginx auth proxy)",
          "targets": [
            {
              "refId": "A",
              "editorMode": "code",
              "expr": "max(aws_applicationelb_target_response_time_p99_00{load_balancer=~\".*-bichard-7-nginx.*\"})",
              "legendFormat": "Max response time",
              "range": true,
              "rawQuery": true,
              "hide": false
            },
            {
              "refId": "B",
              "editorMode": "code",
              "expr": "avg(aws_applicationelb_target_response_time_average{load_balancer=~\".*-bichard-7-nginx.*\"})",
              "legendFormat": "Average response time",
              "range": true,
              "rawQuery": true,
              "hide": false
            }
          ],
          "options": {
            "tooltip": {
              "mode": "single",
              "sort": "none"
            },
            "legend": {
              "displayMode": "list",
              "placement": "bottom",
              "calcs": []
            }
          },
          "fieldConfig": {
            "defaults": {
              "custom": {
                "drawStyle": "line",
                "lineInterpolation": "linear",
                "barAlignment": 0,
                "lineWidth": 1,
                "fillOpacity": 0,
                "gradientMode": "none",
                "spanNulls": false,
                "showPoints": "auto",
                "pointSize": 5,
                "stacking": {
                  "mode": "none",
                  "group": "A"
                },
                "axisPlacement": "auto",
                "axisLabel": "",
                "scaleDistribution": {
                  "type": "linear"
                },
                "hideFrom": {
                  "tooltip": false,
                  "viz": false,
                  "legend": false
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "color": {
                "mode": "palette-classic"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "value": null,
                    "color": "green"
                  },
                  {
                    "value": 80,
                    "color": "red"
                  }
                ]
              }
            },
            "overrides": []
          },
          "datasource": null
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
        "from": "now-3h",
        "to": "now"
    },
    "timepicker": {},
    "timezone": "",
    "title": "Main Dashboard",
    "version": 2
}

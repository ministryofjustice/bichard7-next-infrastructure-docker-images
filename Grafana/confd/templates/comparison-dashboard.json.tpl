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
    "id": 48,
    "links": [],
    "liveNow": false,
    "panels": [
        {
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "palette-classic"
                    },
                    "custom": {
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        }
                    },
                    "mappings": []
                },
                "overrides": [
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "logmetrics_comparison_result_pass_sum{job=\"logmetrics\"}"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "passed"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "logmetrics_comparison_result_fail_sum{job=\"logmetrics\"}"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "failed"
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 8,
                "w": 12,
                "x": 0,
                "y": 0
            },
            "id": 4,
            "options": {
                "legend": {
                    "displayMode": "list",
                    "placement": "bottom"
                },
                "pieType": "pie",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "tooltip": {
                    "mode": "single",
                    "sort": "none"
                }
            },
            "targets": [
                {
                    "expr": "logmetrics_comparison_result_fail_sum{}",
                    "refId": "A"
                },
                {
                    "expr": "logmetrics_comparison_result_pass_sum{}",
                    "refId": "B"
                }
            ],
            "title": "Sum of comparison results pass vs fail",
            "transformations": [
              {
                "id": "reduce",
                "options": {
                  "includeTimeField": false,
                  "labelsToFields": false,
                  "mode": "reduceFields",
                  "reducers": [
                    "max"
                  ]
                }
              }
            ],
            "type": "piechart"
        },
        {
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "palette-classic"
                    },
                    "custom": {
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        }
                    },
                    "mappings": []
                },
                "overrides": [
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "logmetrics_comparison_total_passed_percentage_sum{job=\"logmetrics\"}"
                        },
                        "properties": [
                            {
                                "id": "displayName",
                                "value": "passed"
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 8,
                "w": 12,
                "x": 0,
                "y": 0
            },
            "id": 4,
            "options": {
                "legend": {
                    "displayMode": "list",
                    "placement": "bottom"
                },
                "pieType": "pie",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "tooltip": {
                    "mode": "single",
                    "sort": "none"
                }
            },
            "targets": [
                {
                    "expr": "logmetrics_comparison_total_passed_percentage_sum{}",
                    "refId": "A"
                }
            ],
            "title": "Passed percentage of all comparison results",
            "transformations": [
              {
                "id": "reduce",
                "options": {
                  "includeTimeField": false,
                  "labelsToFields": false,
                  "mode": "reduceFields",
                  "reducers": [
                    "max"
                  ]
                }
              }
            ],
            "type": "piechart"
        }
    ],
    "refresh": "",
    "schemaVersion": 36,
    "style": "dark",
    "tags": [
        "Comparison",
        "Lambda"
    ],
    "templating": {
        "list": []
    },
    "time": {
        "from": "now-3h",
        "to": "now"
    },
    "timepicker": {},
    "timezone": "",
    "title": "Comparison results",
    "uid": "r67Hj4pnq",
    "version": 1,
    "weekStart": ""
}

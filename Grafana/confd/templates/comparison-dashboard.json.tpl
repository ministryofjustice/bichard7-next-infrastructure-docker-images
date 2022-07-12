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
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "datasource": null,
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "pallette-classic"
          },
          "mappings": [],
          "custom": {
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            }
          },
        },
        "overrides": [
          {
          "matcher": {
            "id": "byName",
            "options": "{__name__=\"logmetrics_comparison_result_pass_sum\", job=\"logmetrics\"}"
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
            "options": "{__name__=\"logmetrics_comparison_result_fail_sum\", job=\"logmetrics\"}"
          },
          "properties": [
            {
              "id": "displayName",
              "value": "failed"
            }
        ]
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
          "displayMode": "list",
          "placement": "bottom",
          "values": [
            "value",
            "percent"
          ]
        },
        "pieType": "donut",
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
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "logmetrics_comparison_result_pass_sum{}",
          "refId": "A"
        },
        {
          "expr": "logmetrics_comparison_result_fail_sum{}",
          "refId": "B"
        }
      ],
      "title": "Sum of total comparison pass / fail",
      "transparent": true,
      "type": "piechart"
    }
  ],
  "refresh": "30s",
  "schemaVersion": 36,
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
  "title": "Comparison results",
  "version": 0,
}

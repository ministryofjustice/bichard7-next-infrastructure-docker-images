#!/bin/bash

##
##  This script populates the required environment variables from AWS and run Grafana
##
##  Use the following command to run this script:
##
##  WORKSPACE=<workspace> aws-vault exec <profile> -- ./scripts/run_locally.sh
##

if [[ -z "$WORKSPACE" ]]; then
  echo "WORKSPACE environment variable is required."
  exit 1
fi

function get_load_balancer {
  LOADBALANCER_NAME=$1
  aws elbv2 describe-load-balancers | jq -r ".LoadBalancers[].LoadBalancerArn | select(. | contains(\"cjse-$WORKSPACE-bichard-7-$LOADBALANCER_NAME\")) | split(\"loadbalancer/\")[1]"
}

function get_target_group {
  LOADBALANCER_NAME=$1
  aws elbv2 describe-target-groups | jq -r ".TargetGroups[] | select(.LoadBalancerArns[] | contains(\"cjse-$WORKSPACE-bichard-7-$LOADBALANCER_NAME\")) | .TargetGroupArn | split(\":\")[-1]"
}

function get_ssm_param_value {
  PARAM_NAME=$1
  aws ssm get-parameter --name $1 --with-decryption --output text --query Parameter.Value
}

ENVIRONMENT_FILE=".grafana-$WORKSPACE.env"

if [ ! -f "$ENVIRONMENT_FILE" ]; then
  DOMAIN=$(aws route53 list-hosted-zones-by-name | jq -r ".HostedZones[] | select(.Name | contains(\"$WORKSPACE.\")) | .Name | .[:-1]")
  cat <<EOF > $ENVIRONMENT_FILE
GF_DATABASE_NAME="grafana"
CJSE_BEANCONNECT_NLB=$(get_target_group bean)
CJSE_GRAFANA_ALB=$(get_load_balancer grafana)
GF_LOG_CONSOLE_LEVEL="info"
GF_DATABASE_HOST=$(aws rds describe-db-clusters | jq -r ".DBClusters[] | select(.DatabaseName==\"grafana\") | select(.Endpoint | contains(\"cjse-$WORKSPACE-bichard-7-grafana\")) | .Endpoint")
CJSE_CWATCH_ALB=$(get_load_balancer cwatch)
CJSE_INFRA_BICHARD_LOADBALANCER=$(get_target_group backend)
GF_LOG_CONSOLE_FORMAT="json"
GF_LOG_MODE="console"
CJSE_INFRA_ENVNAME="e2e-test"
CJSE_PROMETHEUS_ALB=$(get_load_balancer monitor)
GF_DATABASE_TYPE="postgres"
CJSE_INFRA_USERSERVICE_TARGETGROUP="get_load_balancer user-s"
CJSE_INFRA_BICHARD_TARGETGROUP=$(get_target_group backend)
CJSE_INFRA_DOMAIN="$DOMAIN"
GF_SERVER_DOMAIN="grafana.$DOMAIN"
ALERTMANAGER_URL="https://alerts.$DOMAIN"
PROMETHEUS_URL="https://prometheus.$DOMAIN"
PROMETHEUS_USER="bichard"
GF_SECURITY_ADMIN_USER=$(get_ssm_param_value /cjse-$WORKSPACE-bichard-7/monitoring/grafana/username)
GF_DATABASE_USER=$(get_ssm_param_value /cjse-$WORKSPACE-bichard-7/monitoring/grafana/db_username)
GF_DATABASE_PASSWORD=$(get_ssm_param_value /cjse-$WORKSPACE-bichard-7/monitoring/grafana/db_password)
GF_SECURITY_ADMIN_PASSWORD=$(get_ssm_param_value /cjse-$WORKSPACE-bichard-7/monitoring/grafana/password)
GF_SECURITY_SECRET_KEY=$(get_ssm_param_value /cjse-$WORKSPACE-bichard-7/monitoring/grafana/secret)
PROMETHEUS_PASSWORD=$(get_ssm_param_value /cjse-$WORKSPACE-bichard-7/monitoring/prometheus/password)
EOF
fi

docker run -it \
  --env-file $ENVIRONMENT_FILE \
  -p 3000:3000 \
  grafana:latest

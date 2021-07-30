#!/usr/bin/env bash

curl 169.254.170.2$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI > /tmp/credentials

TIME=$(date "+%D at %T")

echo "Cycling credentials ${TIME}"

cat <<EOT > ~/.aws/credentials
[default]
aws_access_key_id=$(cat /tmp/credentials | jq ."AccessKeyId")
aws_secret_access_key=$(cat /tmp/credentials | jq ."SecretAccessKey")
aws_session_token=$(cat /tmp/credentials | jq ."Token")
EOT

rm -rf /tmp/credentials

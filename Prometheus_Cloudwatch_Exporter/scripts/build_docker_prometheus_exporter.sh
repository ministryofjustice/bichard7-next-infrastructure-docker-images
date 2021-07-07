#!/usr/bin/env bash

set -e

echo "Build Docker Prometheus Exporter image on `date`"

aws ecr get-login-password --region eu-west-2 | docker login \
  --username AWS \
  --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com

# Get our latest image from our JRE slim repo
IMAGE_HASH=$(aws ecr describe-images \
  --repository-name openjdk-jre11-slim \
  --query 'to_string(sort_by(imageDetails,& imagePushedAt)[-1].imageDigest)'
)

IMAGE_HASH=$(echo $IMAGE_HASH | tr -d '"')
DOCKER_IMAGE_HASH="${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com/openjdk-jre11-slim@${IMAGE_HASH}"
echo "Building from ${DOCKER_IMAGE_HASH}"

docker build --build-arg "BUILD_IMAGE=${DOCKER_IMAGE_HASH}" -t prometheus-cloudwatch-exporter .

docker tag prometheus-cloudwatch-exporter:latest ${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com/prometheus-cloudwatch-exporter:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}

echo "Push Docker image on `date`"
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com/prometheus-cloudwatch-exporter:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}

#!/usr/bin/env bash

set -ev

readonly REPOSITORY_NAME="grafana"
readonly SOURCE_REPOSITORY_NAME="grafana-staged"
readonly REPOSITORY="${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com"
readonly DOCKER_IMAGE_PREFIX="${REPOSITORY}/${REPOSITORY_NAME}"
readonly SOURCE_IMAGE_PREFIX="${REPOSITORY}/${SOURCE_REPOSITORY_NAME}"

echo "Build Grafana image on `date`"

aws ecr get-login-password --region eu-west-2 | docker login \
  --username AWS \
  --password-stdin ${REPOSITORY}

DOCKER_IMAGE_HASH=$(aws ecr describe-images --repository-name ${SOURCE_REPOSITORY_NAME} --query \
  "{\"tags\": to_string(sort_by(imageDetails,& imagePushedAt)[-1].imageDigest)}" | jq .tags | tr -d '"')

echo ${DOCKER_IMAGE_HASH}

docker build \
    --build-arg "BUILD_IMAGE=${SOURCE_IMAGE_PREFIX}@${DOCKER_IMAGE_HASH}" \
    -t ${REPOSITORY_NAME} .

docker tag ${REPOSITORY_NAME}:latest ${DOCKER_IMAGE_PREFIX}:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}
echo "Push Docker image on `date`"

docker push ${DOCKER_IMAGE_PREFIX}:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}

#!/usr/bin/env bash

set -ev

readonly REPOSITORY_NAME="nginx-java-supervisord"
readonly SOURCE_REPOSITORY_NAME="openjdk-jre11-slim"
readonly REPOSITORY="${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com"
readonly DOCKER_IMAGE_PREFIX="${REPOSITORY}/${REPOSITORY_NAME}"
readonly SOURCE_IMAGE_PREFIX="${REPOSITORY}/${SOURCE_REPOSITORY_NAME}"

echo "Build openJDK11 Jre image on `date`"

aws ecr get-login-password --region eu-west-2 | docker login \
  --username AWS \
  --password-stdin ${REPOSITORY}

DOCKER_IMAGE_HASH=$(aws ecr describe-images --repository-name ${SOURCE_REPOSITORY_NAME} --query \
  "{\"tags\": to_string(sort_by(imageDetails,& imagePushedAt)[-1].imageDigest)}" | jq .tags | tr -d '"')

echo ${DOCKER_IMAGE_HASH}

docker build \
  --build-arg "BUILD_IMAGE=${SOURCE_IMAGE_PREFIX}@${DOCKER_IMAGE_HASH}" \
  -t ${REPOSITORY_NAME} . 2>&1 | tee /tmp/docker.out

export SHA_HASH=$(cat /tmp/docker.out | grep digest | cut -d':' -f3-4 | cut -d' ' -f2)

docker tag ${REPOSITORY_NAME}:latest ${DOCKER_IMAGE_PREFIX}:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}
echo "Push Docker image on `date`"

docker push ${DOCKER_IMAGE_PREFIX}:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}

aws codebuild start-build --project-name "build-prometheus-cloudwatch-exporter-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

aws codebuild start-build --project-name "build-prometheus-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

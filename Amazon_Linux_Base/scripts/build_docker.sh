#!/usr/bin/env bash

set -e

readonly REPOSITORY_NAME="amazon-linux2-base"
readonly SOURCE_REPOSITORY_NAME="amazon-linux2"
readonly REPOSITORY="${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com"
readonly DOCKER_IMAGE_PREFIX="${REPOSITORY}/${REPOSITORY_NAME}"
readonly SOURCE_IMAGE_PREFIX="${REPOSITORY}/${SOURCE_REPOSITORY_NAME}"
export DOCKER_IMAGE="${REPOSITORY_NAME}:latest"

echo "Build Amazon Linux 2 image on `date`"
aws ecr get-login-password --region eu-west-2 | docker login \
  --username AWS \
  --password-stdin ${REPOSITORY}

DOCKER_IMAGE_HASH=$(aws ecr describe-images \
  --repository-name ${SOURCE_REPOSITORY_NAME} \
  --query \
  "{\"tags\": to_string(sort_by(imageDetails,& imagePushedAt)[-1].imageDigest)}" | jq .tags | tr -d '"' \
)

docker build \
    --build-arg "BUILD_IMAGE=${SOURCE_IMAGE_PREFIX}@${DOCKER_IMAGE_HASH}" \
    -t ${REPOSITORY_NAME} .

docker tag ${REPOSITORY_NAME}:latest \
  ${DOCKER_IMAGE_PREFIX}:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}

echo "Running tests"
/bin/bash  ../scripts/run_goss_tests.sh

echo "Push Docker image on `date`"
docker push ${DOCKER_IMAGE_PREFIX}:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}

aws codebuild start-build --project-name "build-openjdk-jre11-slim-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

aws codebuild start-build --project-name "build-nodejs-16-docker" \
  --environment-variables-override name=DOCKER_IMAGE_HASH,value="${DOCKER_IMAGE_PREFIX}@${SHA_HASH}",type=PLAINTEXT

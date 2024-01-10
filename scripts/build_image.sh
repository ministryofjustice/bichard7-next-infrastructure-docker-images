#!/usr/bin/env bash

set -ex

## Build image steps
export readonly REPOSITORY="${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com"
export readonly DOCKER_IMAGE_PREFIX="${REPOSITORY}/${REPOSITORY_NAME}"
export readonly SOURCE_IMAGE_PREFIX="${REPOSITORY}/${SOURCE_REPOSITORY_NAME}"
export readonly DOCKER_IMAGE="${REPOSITORY_NAME}:latest"

if [ "$DOCKERFILE" == "" ]; then
  DOCKERFILE="Dockerfile"
fi

echo "Build ${REPOSITORY_NAME} image on `date`"
aws ecr get-login-password --region eu-west-2 | docker login \
  --username AWS \
  --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com

IMAGE_HASH=$(aws ecr describe-images --repository-name ${SOURCE_REPOSITORY_NAME} | jq '.imageDetails|sort_by(.imagePushedAt)[-1].imageDigest' | tr -d '"')

DOCKER_IMAGE_HASH="${SOURCE_IMAGE_PREFIX}@${IMAGE_HASH}"
echo "Building from ${DOCKER_IMAGE_HASH}"

docker build \
  --build-arg "BUILD_IMAGE=${DOCKER_IMAGE_HASH}" \
  ${BUILD_ARGS} \
  -t ${REPOSITORY_NAME} -f ${DOCKERFILE} .

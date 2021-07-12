#!/usr/bin/env bash

set -e

## Build image steps
export readonly REPOSITORY="${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com"
export readonly DOCKER_IMAGE_PREFIX="${REPOSITORY}/${REPOSITORY_NAME}"
export readonly SOURCE_IMAGE_PREFIX="${REPOSITORY}/${SOURCE_REPOSITORY_NAME}"
export readonly DOCKER_IMAGE="${REPOSITORY_NAME}:latest"

echo "Build ${REPOSITORY_NAME} image on `date`"
aws ecr get-login-password --region eu-west-2 | docker login \
  --username AWS \
  --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com

IMAGE_HASH=$(aws ecr describe-images \
  --repository-name ${SOURCE_REPOSITORY_NAME}\
  --query 'to_string(sort_by(imageDetails,& imagePushedAt)[-1].imageDigest)'
)

IMAGE_HASH=$(echo $IMAGE_HASH | tr -d '"')
DOCKER_IMAGE_HASH="${SOURCE_IMAGE_PREFIX}@${IMAGE_HASH}"
echo "Building from ${DOCKER_IMAGE_HASH}"

docker build \
  --build-arg "BUILD_IMAGE=${DOCKER_IMAGE_HASH}" \
  ${BUILD_ARGS} \
  -t ${REPOSITORY_NAME} .

## Test image steps
echo "Running trivy tests against ${DOCKER_IMAGE}"
/bin/bash ../scripts/run_trivy_tests.sh
echo "Running goss tests against ${DOCKER_IMAGE}"
/bin/bash ../scripts/run_goss_tests.sh

## Push image steps
docker tag ${REPOSITORY_NAME}:latest ${DOCKER_IMAGE_PREFIX}:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}

echo "Pushing ${REPOSITORY_NAME} image on `date`"
docker push ${DOCKER_IMAGE_PREFIX}:${CODEBUILD_RESOLVED_SOURCE_VERSION}-${CODEBUILD_START_TIME}



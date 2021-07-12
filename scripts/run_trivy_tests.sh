#!/usr/bin/env bash

set -e

pip install ansible
ansible-galaxy install andrewrothstein.trivy
ansible localhost -m include_role -a name=andrewrothstein.trivy

trivy image ${DOCKER_IMAGE}

#!/usr/bin/env bash

set -ex

yum update -y
yum install -y deltarpm
yum groupinstall -y "Development tools"
yum install -y ${YUM_PACKAGES}
yum install -y ${TEST_PACKAGES}
pip3 install --upgrade pip
pip3 install ${PIP_PACKAGES}

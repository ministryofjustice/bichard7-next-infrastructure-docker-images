#!/usr/bin/env bash

yum install -y deltarpm
yum groupinstall -y "Development tools"
yum install -y ${YUM_PACKAGES}
yum install -y ${TEST_PACKAGES}
pip3 install -u pip3
pip3 install ${PIP_PACKAGES}

#!/usr/bin/env bash

set -ex

dnf update -y
dnf groupinstall -y "Development tools"
dnf install -y ${DNF_PACKAGES}
dnf install -y ${TEST_PACKAGES}
dnf install -y --allowerasing dirmngr

export BROWSERS_SRC_DIR="/usr/src/browsers"
mkdir -p $BROWSERS_SRC_DIR
curl https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
    --output $BROWSERS_SRC_DIR/google-chrome-stable_current_x86_64.rpm
dnf install -y -q $BROWSERS_SRC_DIR/google-chrome-stable_current_x86_64.rpm

pip3 install --ignore-installed pip
pip3 install ${PIP_PACKAGES}

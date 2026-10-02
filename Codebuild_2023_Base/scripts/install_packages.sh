#!/usr/bin/env bash

set -ex

dnf update -y
dnf groupinstall -y "Development tools"
dnf install -y ${DNF_PACKAGES}
dnf install -y ${TEST_PACKAGES}
dnf install -y --allowerasing dirmngr

# Point PATH-based 'python3' and 'pip3' calls to 3.11 safely
ln -sf /usr/bin/python3.11 /usr/local/bin/python3
ln -sf /usr/bin/pip3.11 /usr/local/bin/pip3

gem install bundler

export BROWSERS_SRC_DIR="/usr/src/browsers"
mkdir -p $BROWSERS_SRC_DIR
curl https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
    --output $BROWSERS_SRC_DIR/google-chrome-stable_current_x86_64.rpm
dnf install -y --setopt=install_weak_deps=False -q $BROWSERS_SRC_DIR/google-chrome-stable_current_x86_64.rpm

# Upgrade pip and install packages targeting Python 3.11
python3.11 -m pip install --upgrade pip
python3.11 -m pip install ${PIP_PACKAGES}

#!/usr/bin/env bash

echo "Installing Dependencies"
yum install -y \
  wget \
  curl \
  jq \
  python3-pip \
  git \
  openssl \
  openvpn \
  unzip

pip3 install awscli boto3 click

cd /tmp
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip
chmod +x terraform
mv terraform /usr/bin/.

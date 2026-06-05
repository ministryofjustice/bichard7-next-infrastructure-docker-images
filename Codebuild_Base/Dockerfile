FROM amazonlinux:2@sha256:f482222bab886dcff5a7c9a76e45e1e68374ff219acfe293bd97cb957404efde

ARG TERRAFORM_VERSION="1.8.4"
ARG YUM_PACKAGES="python-pip python3-pip gzip tar unzip openssl shadow-utils xz wget gnupg curl jq git openvpn unzip"
ARG TEST_PACKAGES="which chromium"
ARG PIP_PACKAGES="awscli boto3 click botocore requests"
ARG ARCH="x64"
ARG NODE_USER="node"
ARG NODE_GUID=1000
ARG NODE_VERSION="16.18.1"

COPY ./scripts /tmp

RUN amazon-linux-extras install -y epel && \
    yum install -y --setopt=install_weak_deps=False deltarpm && \
    bash /tmp/install_packages.sh && \
    bash /tmp/install_terraform.sh && \
    bash /tmp/install_nodejs.sh && \
    rm -rf /var/log/* && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp/*.zip && \
    rm -rf /tmp/*.sh

CMD ["tail", "-f", "/dev/null"]

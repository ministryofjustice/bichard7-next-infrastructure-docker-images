ARG BUILD_IMAGE="nodejs"
FROM ${BUILD_IMAGE}

ENV TERRAFORM_VERSION="1.1.3"

ARG YUM_PACKAGES="python-pip python3-pip gzip tar unzip openssl shadow-utils xz wget gnupg curl jq git openvpn unzip"
ARG TEST_PACKAGES="which chromium"
ARG PIP_PACKAGES="install awscli boto3 click botocore requests"

COPY ./scripts /tmp

RUN bash /tmp/install_packages.sh && \
    bash /tmp/install_terraform.sh && \
    rm -rf /var/log/* && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp/*.zip && \
    rm -rf /tmp/*.sh

CMD ["tail", "-f", "/dev/null"]

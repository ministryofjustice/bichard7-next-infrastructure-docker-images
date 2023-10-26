ARG BUILD_IMAGE="nodejs-2023"
FROM ${BUILD_IMAGE}

ARG TERRAFORM_VERSION="1.4.4"

ARG YUM_PACKAGES="gzip tar unzip openssl shadow-utils xz wget gnupg jq git unzip"
ARG TEST_PACKAGES="which"
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

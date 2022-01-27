ARG BUILD_IMAGE="amazon-linux2-base"
FROM ${BUILD_IMAGE}

ENV TERRAFORM_VERSION="1.1.3"

ARG YUM_PACKAGES="python-pip gzip tar unzip openssl shadow-utils xz wget gnupg"
ARG PIP_PACKAGES="awscli jq"

COPY ./scripts /tmp

RUN bash /tmp/install_terraform.sh && \
    rm -rf /var/log/* && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp/*.zip && \
    rm -rf /tmp/*.sh

CMD ["tail", "-f", "/dev/null"]

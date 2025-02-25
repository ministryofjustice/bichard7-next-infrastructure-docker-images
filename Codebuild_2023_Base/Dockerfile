ARG BUILD_IMAGE="amazon-linux2023-base"
FROM ${BUILD_IMAGE}

ARG TERRAFORM_VERSION="1.8.4"
ARG NODE_VERSION="20.18.0"
ARG DNF_PACKAGES="python python-pip python3-pip jq git"
ARG TEST_PACKAGES="which"
ARG PIP_PACKAGES="awscli boto3 click botocore requests"
ARG ARCH="x64"
ARG NODE_USER="node"
ARG NODE_GUID=1000

COPY ./scripts /tmp

RUN bash /tmp/install_packages.sh
RUN bash /tmp/install_terraform.sh
RUN bash /tmp/install_nodejs.sh
RUN rm -rf /var/log/* && \
    dnf clean all && \
    rm -rf /var/cache/dnf && \
    rm -rf /tmp/*.zip && \
    rm -rf /tmp/*.sh

CMD ["tail", "-f", "/dev/null"]

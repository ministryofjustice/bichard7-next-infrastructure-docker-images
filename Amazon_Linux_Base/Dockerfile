ARG BUILD_IMAGE="amazonlinux:2"

FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
ARG YUM_PACKAGES="python-pip gzip tar unzip openssl shadow-utils xz wget gnupg"
ARG PIP_PACKAGES="awscli"

RUN yum update -y && \
    amazon-linux-extras install -y epel && \
    yum install -y deltarpm && \
    yum install -y ${YUM_PACKAGES} && \
    pip install --no-cache-dir ${PIP_PACKAGES} && \
    rm -rf /var/log/* && \
    yum clean all && \
    rm -rf /var/cache/yum

CMD ["tail", "-f", "/dev/null"]

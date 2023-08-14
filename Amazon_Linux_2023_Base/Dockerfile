ARG BUILD_IMAGE="amazonlinux:2023"

FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
ARG DNF_PACKAGES="python python2-pip gzip tar unzip openssl shadow-utils xz wget gnupg"
ARG PIP_PACKAGES="awscli"

RUN dnf update -y && \
    dnf install -y ${DNF_PACKAGES} && \
    pip install --no-cache-dir ${PIP_PACKAGES} && \
    rm -rf /var/log/* && \
    dnf clean all && \
    rm -rf /var/cache/dnf

CMD ["tail", "-f", "/dev/null"]

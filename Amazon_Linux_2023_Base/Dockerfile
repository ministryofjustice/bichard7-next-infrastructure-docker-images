FROM amazonlinux:2023@sha256:c04a1012acc483977f61f7f91c28624a39a621e56a59781319a75dec528be9b6

LABEL org.opencontainers.image.authors="CJSE"

ARG PIP_VERSION="26.2.2"
ARG DNF_PACKAGES="python3.11 python3.11-pip gzip tar unzip openssl shadow-utils xz wget gnupg dirmngr systemd-networkd"

# Install required packages
RUN dnf update -y && \
    dnf install -y --setopt=install_weak_deps=False --allowerasing ${DNF_PACKAGES} && \
    dnf update -y ca-certificates --releasever 2023.1.20230823 && \
    dnf update -y zlib --releasever 2023.2.20231030 && \
    python3.11 -m pip install --no-cache-dir "pip==${PIP_VERSION}" && \
    rm -rf /var/log/* && \
    dnf clean all && \
    rm -rf /var/cache/dnf

RUN useradd -r -m -s /bin/bash appuser

COPY files/nginx.repo /etc/yum.repos.d/nginx.repo

USER appuser

CMD ["tail", "-f", "/dev/null"]

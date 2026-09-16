FROM amazonlinux:2023@sha256:181f98c48832fe926f8ca3b6ffeafcce128e96e77b93d08fbe9a9bc9403ce284

LABEL org.opencontainers.image.authors="CJSE"
ARG DNF_PACKAGES="pip gzip tar unzip openssl shadow-utils xz wget gnupg dirmngr systemd-networkd"

# Install required packages
RUN dnf update -y && \
    dnf install -y --setopt=install_weak_deps=False --allowerasing ${DNF_PACKAGES} && \
    dnf update -y ca-certificates --releasever 2023.1.20230823 && \
    dnf update -y zlib --releasever 2023.2.20231030 && \
    rm -rf /var/log/* && \
    dnf clean all && \
    rm -rf /var/cache/dnf

RUN useradd -r -m -s /bin/bash appuser

COPY files/nginx.repo /etc/yum.repos.d/nginx.repo

USER appuser

CMD ["tail", "-f", "/dev/null"]

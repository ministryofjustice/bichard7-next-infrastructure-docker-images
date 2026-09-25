FROM amazonlinux:2023@sha256:74c545e3e04db388b00bd31d7cc5640d4e9c12058a6d72af938d113da3c82893

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

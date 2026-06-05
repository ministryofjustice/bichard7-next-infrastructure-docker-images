FROM amazonlinux:2023@sha256:ad882807c6c88f478186fa2632637380e06071a303e2b3bd96ab71846a77c6a3

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

USER appuser

CMD ["tail", "-f", "/dev/null"]

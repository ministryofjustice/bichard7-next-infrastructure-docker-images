FROM amazonlinux:2023@sha256:c1872fb69ff9ed9581c999509dd0dcb4288235087f1df4999b866affdac0278d

LABEL org.opencontainers.image.authors="CJSE"
ARG DNF_PACKAGES="pip gzip tar unzip openssl shadow-utils xz wget gnupg"

# Install required packages
RUN dnf update -y && \
    dnf install -y --setopt=install_weak_deps=False --allowerasing ${DNF_PACKAGES} dirmngr

# Install updates
RUN dnf update -y ca-certificates --releasever 2023.1.20230823 && \
    dnf update -y zlib --releasever 2023.2.20231030

RUN useradd -r -m -s /bin/bash appuser

# Cleanup
RUN rm -rf /var/log/* &&\
    dnf clean all &&\
    rm -rf /var/cache/dnf

USER appuser

CMD ["tail", "-f", "/dev/null"]

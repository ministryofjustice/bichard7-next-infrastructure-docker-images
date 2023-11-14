ARG BUILD_IMAGE="amazonlinux:2023"

FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
ARG DNF_PACKAGES="pip gzip tar unzip openssl shadow-utils xz wget gnupg dirmngr"

RUN dnf update -y &&\
    dnf install -y ${DNF_PACKAGES} --allowerasing

RUN dnf update -y ca-certificates --releasever 2023.1.20230823
RUN dnf update -y zlib --releasever 2023.2.20231030 

RUN rm -rf /var/log/* &&\
    dnf clean all &&\
    rm -rf /var/cache/dnf

CMD ["tail", "-f", "/dev/null"]

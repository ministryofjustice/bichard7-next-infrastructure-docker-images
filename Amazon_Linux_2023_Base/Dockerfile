ARG BUILD_IMAGE="amazonlinux:2023"

FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
ARG TERRAFORM_VERSION="1.8.4"
ARG DNF_PACKAGES="pip gzip tar unzip openssl shadow-utils xz wget gnupg"

RUN dnf update -y
RUN dnf install -y ${DNF_PACKAGES}
RUN dnf install dirmngr -y --allowerasing
RUN dnf install -y "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

RUN dnf update -y ca-certificates --releasever 2023.1.20230823
RUN dnf update -y zlib --releasever 2023.2.20231030 

RUN pip3 install --ignore-installed pip
RUN pip3 install awscli boto3 click botocore requests

COPY ./scripts /tmp
RUN bash /tmp/install_terraform.sh

RUN rm -rf /var/log/* &&\
    dnf clean all &&\
    rm -rf /var/cache/dnf && \
    rm -rf /tmp/*.zip && \
    rm -rf /tmp/*.sh

CMD ["tail", "-f", "/dev/null"]

ARG BUILD_IMAGE="amazonlinux:2023"

FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
ARG DNF_PACKAGES="pip gzip tar unzip openssl shadow-utils xz wget gnupg"

RUN dnf update -y &&\
    dnf install -y ${DNF_PACKAGES}

# https://github.com/aws/aws-cli/issues/8036
RUN pip install wheel &&\
    pip install "Cython<3.0" "pyyaml<6" --no-build-isolation 

RUN rm -rf /var/log/* &&\
    dnf clean all &&\
    rm -rf /var/cache/dnf

CMD ["tail", "-f", "/dev/null"]

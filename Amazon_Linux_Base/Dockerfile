ARG BUILD_IMAGE="amazonlinux:2"

FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
ARG YUM_PACKAGES="python-pip gzip tar unzip openssl shadow-utils xz wget gnupg"
ARG PIP_PACKAGES="awscli"

RUN yum update -y &&\
    amazon-linux-extras install -y epel &&\
    yum install -y deltarpm &&\
    yum install -y ${YUM_PACKAGES}

# https://github.com/aws/aws-cli/issues/8036
RUN pip install wheel &&\
    pip install "Cython<3.0" "pyyaml<6" --no-build-isolation &&\
    pip install --no-cache-dir ${PIP_PACKAGES}

RUN rm -rf /var/log/* &&\
    yum clean all &&\
    rm -rf /var/cache/yum

CMD ["tail", "-f", "/dev/null"]

ARG BUILD_IMAGE="amazon-linux2023-base"
FROM ${BUILD_IMAGE}

ARG TERRAFORM_VERSION="1.15.8"
ARG NODE_VERSION="24.22.1"
ARG PIP_VERSION="26.2.2"
ARG DNF_PACKAGES="python3.11 python3.11-pip jq git ruby ruby-devel"
ARG TEST_PACKAGES="which"
ARG ARCH="x64"
ARG NODE_USER="node"
ARG NODE_GUID=1000

# Explicitly we want Codebuild containers to run as root
USER root

COPY ./scripts /tmp

RUN bash /tmp/install_packages.sh && \
    bash /tmp/install_terraform.sh && \
    bash /tmp/install_nodejs.sh && \
    rm -rf /var/log/* && \
    dnf clean all && \
    rm -rf /var/cache/dnf && \
    rm -rf /tmp/*.zip && \
    rm -rf /tmp/*.sh

COPY requirements.txt /tmp/requirements.txt
RUN python3.11 -m pip install --no-cache-dir "pip==${PIP_VERSION}" && \
    python3.11 -m pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt

CMD ["tail", "-f", "/dev/null"]

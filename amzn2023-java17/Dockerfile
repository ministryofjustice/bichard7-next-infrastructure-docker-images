ARG BUILD_IMAGE="amazon-linux2023-base"

FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

RUN dnf update && \
	dnf install -y java-17-amazon-corretto && \
	dnf clean all

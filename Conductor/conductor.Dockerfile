ARG BUILD_IMAGE="amzn2023-java17-nginx-supervisord"

FROM node:18.13-slim as ui-builder

COPY ./conductor/ui /conductor/ui

WORKDIR /conductor/ui
RUN yarn install && yarn build

# ===========================================================================================================
# 0. Builder stage
# ===========================================================================================================
FROM amazoncorretto:17-alpine AS builder

# Copy the project onto the builder image
COPY ./conductor /conductor

# Build the server
WORKDIR /conductor
RUN ./gradlew build -x test

# ===========================================================================================================
# 1. Bin stage
# ===========================================================================================================

FROM ${BUILD_IMAGE}

ARG CONFD_VERSION="0.17.0"
ARG CONFD_CHECKSUM="d6215d210c93bfac31d956acb171469f48038dd0f1dbac93722cea884d782aa5"
ARG CONFD_PLATFORM="amd64"

LABEL maintainer="CJSE"

# Make app folders
RUN mkdir -p /app/config /app/logs /app/libs

RUN wget -O /bin/confd https://github.com/iwilltry42/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-${CONFD_PLATFORM} -nv && \
  echo "${CONFD_CHECKSUM}  /bin/confd" | sha256sum -c && \
  chmod +x /bin/confd && \
  mkdir -p /etc/confd/conf.d && \
  mkdir -p /etc/confd/templates


# Copy the compiled output to new image
COPY --from=builder /conductor/server/build/libs/conductor-server-boot.jar /app/libs

COPY confd /etc/confd/
COPY conf/supervisord.conf /etc/supervisord.conf

# Copy compiled UI assets to nginx www directory
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=ui-builder /conductor/ui/build .

EXPOSE 4000
EXPOSE 5000

HEALTHCHECK --interval=60s --timeout=30s --retries=10 CMD curl -I -XGET http://localhost:8080/health || exit 1

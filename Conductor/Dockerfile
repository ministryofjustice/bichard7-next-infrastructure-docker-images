ARG BUILD_IMAGE="nginx-java-supervisord"


# ===========================================================================================================
# 0. Builder stage
# ===========================================================================================================
FROM openjdk:11-jdk AS builder

# Install Node
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -qq --no-install-recommends \
    build-essential \
    nodejs \
    yarn \
  && apt-get upgrade -qq \
  && rm -rf /var/lib/apt/lists/*

# Copy the project onto the builder image
COPY ./conductor /conductor

# Build the server
WORKDIR /conductor
RUN ./gradlew build -x test

# Build the client
WORKDIR /conductor/ui
RUN yarn install && yarn build

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
COPY --from=builder /conductor/ui/build .

# Copy the files for the server into the app folders
# RUN chmod +x /app/startup.sh

EXPOSE 5000

HEALTHCHECK --interval=60s --timeout=30s --retries=10 CMD curl -I -XGET http://localhost:8080/health || exit 1

# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

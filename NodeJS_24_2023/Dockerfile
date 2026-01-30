ARG BUILD_IMAGE="amazon-linux2023-base"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

ARG NODE_USER="node"
ARG NODE_GUID=1000
ARG ARCH="x64"
ARG NODE_VERSION="24.11.1"

COPY scripts/docker-entrypoint.sh /usr/local/bin/

WORKDIR /tmp

USER root

RUN groupadd --gid ${NODE_GUID} ${NODE_USER} && \
    useradd --uid ${NODE_GUID} --gid ${NODE_USER} --shell /bin/bash --create-home ${NODE_USER} && \
    for key in \
      5BE8A3F6C8A5C01D106C0AD820B1A390B168D356 \
      DD792F5973C6DE52C432CBDAC77ABFA00DDBF2B7 \
      CC68F5A3106FF448322E48ED27F5E38D5B0A215F \
      8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
      890C08DB8579162FEE0DF9DB8BEAB4DFCF555EF4 \
      C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C \
      108F52B48DB57BB0CC439B2997B01419BD92F80A \
      A363A499291CBBC940DD62E41F10027AF002F8B0 \
    ; do \
      gpg --batch --keyserver hkp://keyserver.ubuntu.com --recv-keys "$key" || \
      gpg --batch --keyserver hkp://keys.openpgp.org --recv-keys "$key" ; \
    done && \
    curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" && \
    curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" && \
    gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc && \
    grep " node-v$NODE_VERSION-linux-$ARCH.tar.xz\$" SHASUMS256.txt | sha256sum -c - && \
    tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner && \
    rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt && \
    ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    node --version && \
    npm --version && \
    mkdir -p /opt && \
    rm -rf * && \
    dnf clean all && \
    rm -rf /var/cache/dnf && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /

USER ${NODE_USER}

ARG BUILD_IMAGE="amazon-linux2023-base"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

ARG NODE_USER="node"
ARG NODE_GUID=1000
ARG ARCH="x64"
ARG NODE_VERSION="20.18.0"

COPY scripts/docker-entrypoint.sh /usr/local/bin/

WORKDIR /tmp

USER root

RUN groupadd --gid ${NODE_GUID} ${NODE_USER} && \
    useradd --uid ${NODE_GUID} --gid ${NODE_USER} --shell /bin/bash --create-home ${NODE_USER} && \
    for key in \
      4ED778F539E3634C779C87C6D7062848A1AB005C \
      141F07595B7B3FFE74309A937405533BE57C7D57 \
      94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
      74F12602B6F1C4E913FAA37AD3A89613643B6201 \
      71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
      8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
      C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
      890C08DB8579162FEE0DF9DB8BEAB4DFCF555EF4 \
      C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C \
      DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
      A48C2BEE680E841632CD4E44F07496B3EB3C1762 \
      108F52B48DB57BB0CC439B2997B01419BD92F80A \
      B9E2F5981AA6E0CD28160D9FF13993A75599653C \
    ; do \
      gpg --batch --keyserver hkp://keyserver.ubuntu.com --recv-keys "$key" || \
      gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
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

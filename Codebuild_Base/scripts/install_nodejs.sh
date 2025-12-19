#!/usr/bin/env bash

set -ex

groupadd --gid ${NODE_GUID} ${NODE_USER}
useradd --uid ${NODE_GUID} --gid ${NODE_USER} --shell /bin/bash --create-home ${NODE_USER}

curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz"
curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt"
grep " node-v$NODE_VERSION-linux-$ARCH.tar.xz\$" SHASUMS256.txt | sha256sum -c -

tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner
rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" SHASUMS256.txt
ln -s /usr/local/bin/node /usr/local/bin/nodejs
node --version
npm --version

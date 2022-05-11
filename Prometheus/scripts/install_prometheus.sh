#!/usr/bin/env bash

set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

echo "Installing Prometheus"
VERSION=$(get_latest_release "prometheus/prometheus" | sed 's/v//')
PROM_FILE="prometheus-${VERSION}.linux-amd64"
PROM_TARBALL="${PROM_FILE}.tar.gz"
PROM_URL="https://github.com/prometheus/prometheus/releases/download/v${VERSION}/${PROM_TARBALL}"

wget ${PROM_URL}
tar -xf ${PROM_TARBALL}
rm -rf ${PROM_TARBALL}

cd ${PROM_FILE}

mkdir -p /usr/share/prometheus/
mkdir -p /prometheus
mkdir -p /etc/prometheus

mv prometheus /bin/prometheus
mv promtool /bin/promtool
mv console_libraries /usr/share/prometheus/.
mv consoles /usr/share/prometheus/.

ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/
mkdir -p /prometheus && \
    chown -R nobody:nobody /etc/prometheus /prometheus
cd ../
rm -rf ${PROM_FILE}

echo "Installing AlertManager"
AM_REPO="prometheus/alertmanager"
AM_VERSION=$(get_latest_release "${AM_REPO}" | sed 's/v//')
AM_FILE="alertmanager-${AM_VERSION}.linux-amd64"
AM_TARBALL="${AM_FILE}.tar.gz"
AM_URL="https://github.com/${AM_REPO}/releases/download/v${AM_VERSION}/${AM_TARBALL}"

wget ${AM_URL}
tar -xf ${AM_TARBALL}
rm -rf ${AM_TARBALL}

mv ${AM_FILE}/alertmanager /usr/bin/
mv ${AM_FILE}/amtool /usr/bin/

chmod +x /bin/alertmanager /bin/amtool
mkdir -p /etc/alertmanager
chown -R nobody:nobody /etc/alertmanager /bin/alertmanager
rm -rf ${AM_FILE}


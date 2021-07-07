ARG BUILD_IMAGE="amazon-linux2-base"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"
LABEL "origin_source"="https://github.com/docker-library/openjdk/blob/master/11/jre/slim-buster/Dockerfile"

RUN set -eux && \
	yum install -y ca-certificates \
	  p11-kit \
	  dirmngr

ENV JAVA_HOME /usr/local/openjdk-11
RUN { echo '#/bin/sh'; echo 'echo "$JAVA_HOME"'; } > /usr/local/bin/docker-java-home && \
    chmod +x /usr/local/bin/docker-java-home && \
    [ "$JAVA_HOME" = "$(docker-java-home)" ]

ENV PATH $JAVA_HOME/bin:$PATH
ENV LANG C.UTF-8
ENV JAVA_VERSION 11.0.10

RUN set -euvx && \
	downloadUrl='https://github.com/AdoptOpenJDK/openjdk11-upstream-binaries/releases/download/jdk-11.0.10%2B9/OpenJDK11U-jre_x64_linux_11.0.10_9.tar.gz' && \
	wget --progress=dot:giga -O openjdk.tgz "$downloadUrl" && \
	wget --progress=dot:giga -O openjdk.tgz.asc "$downloadUrl.sign" && \
	export GNUPGHOME="$(mktemp -d)" && \
	gpg --batch --keyserver hkp://keyserver.ubuntu.com --recv-keys EAC843EBD3EFDB98CC772FADA5CD6035332FA671 && \
	gpg --batch --keyserver hkp://keyserver.ubuntu.com --keyserver-options no-self-sigs-only --recv-keys CA5F11C6CE22644D42C6AC4492EF8D39DC13168F && \
	gpg --batch --list-sigs --keyid-format 0xLONG CA5F11C6CE22644D42C6AC4492EF8D39DC13168F | tee /dev/stderr | grep '0xA5CD6035332FA671' | grep 'Andrew Haley' && \
	gpg --batch --verify openjdk.tgz.asc openjdk.tgz && \
	rm -rf "$GNUPGHOME" && \
	mkdir -p "$JAVA_HOME" && \
	tar --extract --file openjdk.tgz --directory "$JAVA_HOME" --strip-components 1 --no-same-owner && \
	rm openjdk.tgz* && \
	{ \
		echo '#!/usr/bin/env bash'; \
		echo 'set -Eeuo pipefail'; \
		echo 'trust extract --overwrite --format=java-cacerts --filter=ca-anchors --purpose=server-auth "$JAVA_HOME/lib/security/cacerts"'; \
	} > /etc/pki/ca-trust/extracted/java/docker-openjdk && \
	chmod +x /etc/pki/ca-trust/extracted/java/docker-openjdk && \
	/etc/pki/ca-trust/extracted/java/docker-openjdk && \
	find "$JAVA_HOME/lib" -name '*.so' -exec dirname '{}' ';' | sort -u > /etc/ld.so.conf.d/docker-openjdk.conf && \
	ldconfig && \
	java -Xshare:dump && \
	java --version && \
	rm -rf /var/log/* && \
    yum clean all && \
    rm -rf /var/cache/yum

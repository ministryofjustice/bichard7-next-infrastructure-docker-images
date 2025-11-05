ARG BUILD_IMAGE="amazon-linux2023-base"

FROM node:20-alpine AS ui-builder

ARG CONDUCTOR_VERSION

RUN apk add git
RUN git clone --depth=1 -b ${CONDUCTOR_VERSION} https://github.com/conductor-oss/conductor.git /conductor

WORKDIR /conductor/ui
RUN npm install --legacy-peer-deps
RUN npm run build

# ===========================================================================================================
# 0. Builder stage
# ===========================================================================================================
FROM eclipse-temurin:17-jdk-jammy AS builder

ARG CONDUCTOR_VERSION

RUN git clone --depth=1 -b ${CONDUCTOR_VERSION} https://github.com/conductor-oss/conductor.git /conductor

# Build the server

WORKDIR /conductor

RUN sed -i 's/^subprojects {$/ext["tomcat.version"] = "10.1.41"\n\n&/' build.gradle

RUN sed -i "s/revRedisson = '3\.13\.3'/revRedisson = '3.22.0'/" dependencies.gradle

#This will cache the downloaded gradle so repeated runs are faster
RUN ./gradlew --version
RUN ./gradlew build -x test

# ===========================================================================================================
# 1. Bin stage
# ===========================================================================================================

FROM ${BUILD_IMAGE}

ARG CONDUCTOR_VERSION

LABEL maintainer="CJSE"
LABEL conductor_version=$CONDUCTOR_VERSION

COPY files/openssl.cnf /tmp/openssl.cnf

RUN mkdir -p /certs /var/log/supervisor && \
  yum install -y nginx httpd-tools gettext && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  pip install supervisor && \
  openssl req -x509 -nodes -days 730 -newkey rsa:4096 \
  -out /certs/server.crt -keyout /certs/server.key \
  -config /tmp/openssl.cnf -extensions 'v3_req' && \
  rm -rf /tmp/openssl.cnf

# Make app folders
RUN mkdir -p /app/config /app/logs /app/libs

# Install Java
RUN dnf update && \
  dnf install -y java-17-amazon-corretto && \
  dnf clean all

# Copy the compiled output to new image
COPY --from=builder /conductor/server/build/libs/*boot*.jar /app/libs/conductor-server.jar

# Copy the config files
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/config.properties /app/config/config.properties
COPY files/templates /etc/templates/
COPY files/supervisord.conf /etc/supervisord.conf
COPY files/process_templates.sh /bin/process_templates.sh
RUN chmod 755 /bin/process_templates.sh

# Copy compiled UI assets to nginx www directory
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=ui-builder /conductor/ui/build .

EXPOSE 4000
EXPOSE 5000

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

HEALTHCHECK --interval=60s --timeout=30s --retries=10 CMD curl -I -XGET http://localhost:8080/health || exit 1

ARG BUILD_IMAGE="liquibase/liquibase:5.0"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

RUN lpm add postgresql --global

USER root
RUN rm -rf /liquibase/bin/lpm 
USER liquibase

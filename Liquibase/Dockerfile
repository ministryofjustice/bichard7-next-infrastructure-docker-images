ARG BUILD_IMAGE="liquibase/liquibase:5.0@sha256:32c10b8aa43534e704e533214e7b3f9d2898f3df01ac47b6e4a85358c53c836f"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

RUN lpm add postgresql --global

USER root
RUN rm -rf /liquibase/bin/lpm 
USER liquibase

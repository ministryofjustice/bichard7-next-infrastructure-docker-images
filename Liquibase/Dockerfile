FROM liquibase/liquibase:5.0.3@sha256:dfe136c26d39088d87d1bd27f833d6ac5b738a180d7c960b065c7be525725d01

LABEL org.opencontainers.image.authors="CJSE"

RUN lpm add postgresql --global

USER root
RUN rm -rf /liquibase/bin/lpm
USER liquibase

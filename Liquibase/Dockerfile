FROM liquibase/liquibase:5.0@sha256:060f96efff4811ccf03957ff3160f21ea04139b89940640f8ad54a065cdc6906

LABEL org.opencontainers.image.authors="CJSE"

RUN lpm add postgresql --global

USER root
RUN rm -rf /liquibase/bin/lpm
USER liquibase

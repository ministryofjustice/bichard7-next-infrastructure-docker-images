ARG BUILD_IMAGE="amazon-linux2-base"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

WORKDIR /

# Load logstash versions for yum
COPY ./files/logstash.repo /etc/yum.repos.d
COPY scripts/credentials.sh /usr/bin/credentials

# This must match what is deployed on AWS
ARG LOGSTASH_VERSION="8.8.2-1"
ARG CONFD_VERSION="0.16.0"
ARG CONFD_CHECKSUM="255d2559f3824dd64df059bdc533fd6b697c070db603c76aaf8d1d5e6b0cc334"

RUN mkdir -p /var/log/supervisor && \
  yum makecache && \
  yum install -y \
    supervisor \
    logstash-${LOGSTASH_VERSION} \
    cronie && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  wget -O /bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -nv && \
  echo "${CONFD_CHECKSUM}  /bin/confd" | sha256sum -c && \
  chmod +x /bin/confd && \
  chmod +x /usr/bin/credentials && \
  mkdir -p /etc/confd/conf.d && \
  mkdir -p /etc/confd/templates && \
  mkdir -p /etc/logstash/patterns
RUN /usr/share/logstash/bin/logstash-plugin install logstash-integration-aws logstash-output-opensearch
RUN chown -R logstash:logstash /usr/share/logstash

WORKDIR /
EXPOSE     9600

COPY conf/supervisord.conf /etc/supervisord.conf
COPY confd /etc/confd/
COPY conf/logstash/ /etc/logstash
COPY files/logstash.patterns /etc/logstash/patterns/cjse
COPY files/postfix.patterns /etc/logstash/patterns/postfix
COPY conf/config /root/.aws/config
COPY conf/crontab /var/spool/cron/root

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

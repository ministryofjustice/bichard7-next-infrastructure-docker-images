ARG BUILD_IMAGE="amazon-linux2-base"
FROM ${BUILD_IMAGE}

LABEL maintainer="CJSE"

WORKDIR /

COPY ./files/logstash.repo /etc/yum.repos.d
COPY scripts/credentials.sh /usr/bin/credentials
# This must match what is deployed on AWS
ARG LOGSTASH_VERSION="7.10.1"
ARG CONFD_VERSION="0.16.0"

RUN mkdir -p /var/log/supervisor && \
  yum makecache && \
  yum install -y \
    supervisor \
    logstash-${LOGSTASH_VERSION} \
    cronie && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  wget -O /bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
  chmod +x /bin/confd && \
  chmod +x /usr/bin/credentials && \
  mkdir -p /etc/confd/{conf.d,templates} && \
  mkdir -p /etc/logstash/patterns && \
  /usr/share/logstash/bin/logstash-plugin install logstash-input-cloudwatch_logs

EXPOSE     9600

COPY conf/supervisord.conf /etc/supervisord.conf
COPY confd /etc/confd/
COPY conf/logstash/ /etc/logstash
COPY files/logstash.patterns /etc/logstash/patterns/cjse
COPY conf/config /root/.aws/config
COPY conf/crontab /var/spool/cron/root

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

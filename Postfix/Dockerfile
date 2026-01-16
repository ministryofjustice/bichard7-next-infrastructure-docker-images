ARG BUILD_IMAGE="amazon-linux2023-base"
FROM ${BUILD_IMAGE}

ARG CONFD_VERSION="0.16.0"
ARG CONFD_CHECKSUM="255d2559f3824dd64df059bdc533fd6b697c070db603c76aaf8d1d5e6b0cc334"

# We need to run as root for Postfix to work
USER root

RUN yum install -y postfix cyrus-sasl rsyslog s-nail && \
    pip install supervisor && \
    mkdir -p /var/log/supervisor && \
    sed -i -e 's/inet_interfaces = localhost/inet_interfaces = all/g' /etc/postfix/main.cf && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    wget -O /bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -nv && \
    echo "${CONFD_CHECKSUM}  /bin/confd" | sha256sum -c && \
    chmod +x /bin/confd && \
    mkdir -p /etc/confd/ && \
    touch /var/log/maillog && \
    chown postfix:postfix /var/log/maillog

COPY ./files/conf/master.cf /etc/postfix/master.cf
COPY ./confd /etc/confd
COPY ./files/conf/supervisord.conf /etc/supervisord.conf
COPY ./files/start_postfix.sh /start_postfix.sh
COPY ./files/conf/rsyslog.conf /etc/rsyslog.conf

RUN chmod +x /start_postfix.sh

EXPOSE 25
EXPOSE 465

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

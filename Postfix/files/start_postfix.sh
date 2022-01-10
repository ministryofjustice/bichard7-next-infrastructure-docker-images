#!/bin/bash

# generate aliases database
newaliases

# Change syslog to local logging and start it
rm -f /etc/rsyslog.d/listen.conf
echo "Starting rsyslogd..."
rsyslogd
sleep 1
echo "rsyslog started"

echo "Starting postfix..."
postfix start
# lets give postfix some time to start
sleep 3
echo "OK running"

tail -F /var/log/maillog

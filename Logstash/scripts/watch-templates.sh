#!/bin/bash

export TERM="xterm"

if [ "$(uname)" == "Darwin" ]; then
  # Mac OSX
  WATCH_COMMAND="ls -R -l -T ./confd | md5"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  WATCH_COMMAND="ls --all -l --recursive --full-time ./confd | sha256sum"
fi

trap "echo Exited!; exit;" SIGINT SIGTERM
echo "Watching template files changes..."
while [[ 1=1 ]]
do
  watch -t --chgexit -n 1 "${WATCH_COMMAND}" 1> /dev/null && \
    echo "Updating logstash file changes..." && \
    docker exec -it $(docker compose ps logstash -q) rm -rf /etc/logstash-dev/conf.d 2> /dev/null && \
    docker cp ./confd $(docker compose ps logstash -q):/etc/logstash-dev && \
    docker exec -it $(docker compose ps logstash -q) /bin/confd -onetime -backend env -confdir /etc/logstash-dev/confd

  echo "Logstash files updated."
  sleep 1
done

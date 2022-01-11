#!/bin/bash

sleep 5
# generate aliases database
echo "Generating new aliases"
newaliases

# update our certificate cache
echo "Updating CA Trust"
update-ca-trust

echo "Starting postfix..."
postfix start
sleep 3
tail -F /var/log/maillog

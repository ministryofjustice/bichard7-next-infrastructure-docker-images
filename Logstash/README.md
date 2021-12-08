## Setting up

Copy the template from `goss.env.tmpl` to `goss.env`

Run `aws-vault exec <account_name> -- env | grep AWS` and copy the following into the goss.env file

```shell
AWS_DEFAULT_REGION=eu-west-2
AWS_REGION=eu-west-2
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_SESSION_TOKEN=
AWS_SECURITY_TOKEN=
```

Set the `CJSE_ENVIRONMENT` variable to the name of the environment you want to pull
data from.

### Running against a local ES to develop/debug grok filters

Delete the `CJSE_LOGSTASH_ES_USERNAME` and `CJSE_LOGSTASH_ES_PASSWORD` env vars from
goss.env

run docker-compose up, bootstrapping the first time will take about 5 minutes. 
You can then docker exec into the `logstash` container and modify the relevant .conf 
file. Logstash will reload automatically if they have changed.

You can then connect to Kibana on http://localhost:5601, go to the `global` tenant if prompted,
then click on discover and it should take you to the index patterns. If there is no data, give it a few minutes to start
ingesting, then hit refresh and create an index pattern with `*logs*` as the pattern. When prompted
for the timestamp field use `@datestamp`

If you see this error `<LogStash::ConfigurationError: Explicit value for 'scheme' was declared` the users in the elastic search config
is still declared, delete the 2 vars mentioned in the beginning and restart the logstash container

### Running against the remote ES to test grok filters

Connect to the vpn

Now get the ES endpoint from AWS and set `CJSE_LOGSTASH_ES_DOMAIN` to point to it, remember the https and to suffix it with :443

Update the CJSE_ENVIRONMENT variable to point to the correct environment, then finally get the 
`CJSE_LOGSTASH_ES_USERNAME` and `CJSE_LOGSTASH_ES_PASSWORD` values from SSM. Once this is all set, 
docker-compose up logstash to start just that container.

#### Developing grok filters

Once you have the logs coming through on kibana you can develop your grok filters through the kibana interface.

Click the hamburger menu in the top left > Management > Dev Tools

Then click through the "Grok Debugger". From there you can paste some sample logs and test out regex and even develop custom matchers.


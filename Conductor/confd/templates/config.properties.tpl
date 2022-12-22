# Servers.
conductor.grpc-server.enabled=false

# Database persistence type.
{{ with getv "/cjse/conductor/db/type" "postgres" }}
conductor.db.type={{ . }}

{{ if eq . "postgres" }}
spring.datasource.url={{ getv "/cjse/conductor/postgres/url" "jdbc:postgresql://postgres:5432/conductor" }}
spring.datasource.username={{ getv "/cjse/conductor/postgres/username" "conductor" }}
spring.datasource.password={{ getv "/cjse/conductor/postgres/password" "conductor" }}
{{ end }}
{{ end }}

# Hikari pool sizes are -1 by default and prevent startup
spring.datasource.hikari.maximum-pool-size=10
spring.datasource.hikari.minimum-idle=2

# Elastic search instance indexing
{{ with getv "/cjse/conductor/indexing/enabled" "true" }}
conductor.indexing.enabled={{ . }}

{{ if eq . "true" }}
# Transport address to elasticsearch
conductor.elasticsearch.url={{ getv "/cjse/conductor/elasticsearch/url" "http://es:9200" }}

# Name of the elasticsearch cluster
conductor.elasticsearch.indexName={{ getv "/cjse/conductor/elasticsearch/indexname" "conductor" }}
{{ end }}
{{ end }}

# Load sample kitchen sink workflow
loadSample=false

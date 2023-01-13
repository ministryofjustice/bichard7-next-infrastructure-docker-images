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
conductor.elasticsearch.version=6
conductor.elasticsearch.url={{ getv "/cjse/conductor/elasticsearch/url" "http://es:9200" }}
conductor.elasticsearch.username={{ getv "/cjse/conductor/elasticsearch/username" "bichard" }}
conductor.elasticsearch.password={{ getv "/cjse/conductor/elasticsearch/password" "password" }}

# Name of the elasticsearch cluster
conductor.elasticsearch.indexName={{ getv "/cjse/conductor/elasticsearch/indexname" "conductor" }}
{{ end }}
{{ end }}

# Load sample kitchen sink workflow
loadSample=false

# Configure S3 for external storage
# workflow.external.payload.storage=S3
# workflow.external.payload.storage.s3.bucket={{ getv "/cjse/conductor/s3/bucket" "bucket" }}

# Decrease the time needed for system tasks to complete
conductor.app.systemTaskWorkerCallbackDuration=1

# Increase the number of execution logs that Conductor will keep for each task
conductor.app.taskExecLogSizeLimit=10000
conductor.elasticsearch.taskLogResultLimit=10000

# Increase thresholds for external storage
conductor.app.workflowInputPayloadSizeThreshold=512000
conductor.app.maxWorkflowInputPayloadSizeThreshold=1024000
conductor.app.workflowOutputPayloadSizeThreshold=512000
conductor.app.maxWorkflowOutputPayloadSizeThreshold=1024000
conductor.app.taskInputPayloadSizeThreshold=307200
conductor.app.maxTaskInputPayloadSizeThreshold=1024000
conductor.app.taskOutputPayloadSizeThreshold=307200
conductor.app.maxTaskOutputPayloadSizeThreshold=1024000
conductor.app.maxWorkflowVariablesPayloadSizeThreshold=25600

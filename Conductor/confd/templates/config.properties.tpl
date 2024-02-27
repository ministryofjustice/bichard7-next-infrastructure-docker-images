# Servers.
conductor.grpc-server.enabled=false

# Set the database persistence type to postgres
conductor.db.type=postgres
conductor.queue.type=postgres

# Hikari pool sizes are -1 by default and prevent startup
spring.datasource.hikari.maximum-pool-size=10
spring.datasource.hikari.minimum-idle=2

# Configure indexing in postgres
conductor.indexing.enabled=true
conductor.indexing.type=postgres
conductor.postgres.onlyIndexOnStatusChange=true
conductor.elasticsearch.version=postgres

# Load sample kitchen sink workflow
loadSample=false

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

# Decrease the time needed for system tasks to complete
conductor.app.systemTaskWorkerCallbackDuration=1

# Increase the number of execution logs that Conductor will keep for each task
conductor.app.taskExecLogSizeLimit=10000

# Stop requiring ownerEmails in task/workflow definitions
conductor.app.ownerEmailMandatory=false

# Configure the SQS integration
conductor.default-event-queue.type=sqs
conductor.event-queues.sqs.enabled=true
conductor.event-queues.sqs.listenerQueuePrefix=conductor_

conductor.app.eventProcessorThreadCount=10

conductor.metrics-prometheus.enabled=true
management.endpoints.web.exposure.include=prometheus

# bichard7-next-infrastructure-docker-images

Docker image builds for the Bichard 7 project

-   [Amazon Linux Base](./Amazon_Linux_Base/Dockerfile) - Amazon Linux 2 with patches and some base sofware installed
    -   [Grafana](./Grafana/Dockerfile) - Our build of Grafana
    -   [Logstash](./Logstash/Dockerfile) - Logstash log parser
    -   [Nginx Supervisord](./Nginx_Supervisord/Dockerfile) - Amazon Linux 2 with Nginx and Supervisord
        -   [Nginx Auth Proxy](./Nginx_Auth_Proxy/Dockerfile) - The front end proxy for Bichard
    -   [NodeJS 16](./NodeJS/Dockerfile) - NodeJS 16 installed on AmazonLinux
        -   [Codebuild Base](./Codebuild_Base/Dockerfile) - The image used for Codebuild
        -   [Nginx_NodeJS_Supervisord](./Nginx_NodeJS_Supervisord/Dockerfile) - Nginx with self signed certs running on NodeJS 16
            -   [S3 Web Proxy](./S3_Web_Proxy/Dockerfile) - Used to serve files from S3
            -   [Scanning Results Portal](./Scanning_Results_Portal) - Used for exposing our scanning results bucket built from nginx nodejs image
        -   Used by: [PNC Emulator](https://github.com/ministryofjustice/bichard7-next-pnc-emulator/blob/main/docker/Dockerfile) - for testing only
    -   Used by: [Beanconnect](https://github.com/ministryofjustice/bichard7-next-beanconnect/blob/main/Dockerfile)
    -   [OpenJDK JRE 11 Slim](./Openjdk_Jre11_Slim/Dockerfile) - OpenJDK JRE 11 Installed on Amazon Linux
        -   [Nginx_Java_Supervisord](./Nginx_Java_Supervisord/Dockerfile) - Nginx with self signed certs running on our OpenJDK base
            -   [Prometheus](./Prometheus/Dockerfile) - Prometheus and Prometheus Alert Manager with HTTP Authentication Via NGINX
            -   [Prometheus Blackbox Exporter](./Prometheus_BlackBox_Exporter/Dockerfile) - Prometheus Black Box Exporter with HTTPS via Nginx
            -   [Prometheus Cloudwatch Exporter](./Prometheus_Cloudwatch_Exporter/Dockerfile) - Prometheus Cloudwatch Exporter with HTTPS via Nginx
    -   [Postfix](./Postfix/Dockerfile) - Postfix Mail Server
-   [Amazon Linux 2023 Base](./Amazon_Linux_2023_Base/Dockerfile) - Amazonlinux 2 with patches and some base sofware installed
    -   [amzn2023-java17](./amzn2023-java17/Dockerfile) - Amazon Linux 2023 with Java 17 installed
        -   [amzn2023-java17-nginx-supervisord](./amzn2023-java17-nginx-supervisord/Dockerfile) - Amazon Linux 2023 with Java 17, Nginx and Supervisord installed
            -   [Conductor](./Conductor/Dockerfile) - The Conductor image
    -   [NodeJS 2023](./NodeJS_2023/) - Node 16 on Amazon Linux 2023
        -   [Nginx NodeJS 2023 Supervisord](./Nginx_NodeJS_2023_Supervisord/) - The above with Nginx and Supoervisord installed
    -   [NodeJS 20 2023](./NodeJS_2023/) - Node 20 on Amazon Linux 2023
        -   [Nginx NodeJS 20 2023 Supervisord](./Nginx_NodeJS_20_2023_Supervisord/) - The above with Nginx and Supervisord installed
            -   Used by: [Bichard User Service](https://github.com/ministryofjustice/bichard7-next-user-service)
            -   Used by: [Bichard UI](https://github.com/ministryofjustice/bichard7-next-ui)
        -   Used by: [Core Conductor Worker](https://github.com/ministryofjustice/bichard7-next-core/blob/main/packages/conductor/Dockerfile)
        -   Used by: [Audit Log API](https://github.com/ministryofjustice/bichard7-next-audit-logging/blob/main/src/audit-log-api/Dockerfile) - for testing only
        -   Used by: [Event Handler](https://github.com/ministryofjustice/bichard7-next-audit-logging/blob/main/src/event-handler/Dockerfile) - for testing only
        -   Used by: [Message Forwarder](https://github.com/ministryofjustice/bichard7-next-core/blob/main/packages/message-forwarder/Dockerfile)

## Testing

All images are tested using goss prior to pushing to the relevant registries. For more information on goss/dgoss please see
https://github.com/aelsabbahy/goss/tree/master/extras/dgoss

To scan the images for vulnerabilities we use trivy see https://aquasecurity.github.io/trivy/v0.22.0/getting-started/installation/

## Building locally

You can skip the goss/dgoss requirement by setting the environment variable `SKIP_GOSS=true`. To only build the images needed to run Bichard locally, you can run `SKIP_GOSS=true make build-local`

### Buildkit

Buildkit is an option in Docker Desktop. If you're getting errors building Docker images, you might need to change to `"buildkit": false` in Docker Desktop > Options > Docker Engine.

### Building on an ARM-based Mac

You can build the images used to run the stack components for an ARM Mac by setting the environment variable `PLATFORM=arm64`. Note: this does not apply to the monitoring infrastructure docker images at this point since they generally don't need running locally.

### Troubleshooting

Make sure you have installed [wget](https://www.gnu.org/software/wget/)

```
brew install wget
```

If you don't have [goss](https://goss.rocks/) installed and want to use it, use the script provided.

```
cd bichard7-next-infrastructure-docker-images
sh ./scripts/install_goss.sh
```

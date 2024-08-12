# bichard7-next-infrastructure-docker-images


Docker image builds for the Bichard 7 project

-   [Codebuild Base](./Codebuild_Base/Dockerfile) - The image used for Codebuild (based on Amazon Linux 2 as it supports OpenVPN)
-   [Amazon Linux 2023 Base](./Amazon_Linux_2023_Base/Dockerfile) - Amazon Linux 2023 with patches and some base software installed
    -   [Conductor](./Conductor/Dockerfile) - The Conductor image
    -   [Nginx Auth Proxy](./Nginx_Auth_Proxy/Dockerfile) - The front end proxy for Bichard
    -   [Postfix](./Postfix/Dockerfile) - Postfix Mail Server
    -   [NodeJS 20 2023](./NodeJS_20_2023/) - Node 20 on Amazon Linux 2023
        -   [Nginx NodeJS 20 2023 Supervisord](./Nginx_NodeJS_20_2023_Supervisord/) - The above with Nginx and Supervisord installed
            -   [S3 Web Proxy](./S3_Web_Proxy/Dockerfile) - Used to serve files from S3
            -   Used by: [Bichard User Service](https://github.com/ministryofjustice/bichard7-next-user-service)
            -   Used by: [Bichard UI](https://github.com/ministryofjustice/bichard7-next-ui)
        -   Used by: [Core API](https://github.com/ministryofjustice/bichard7-next-core/blob/main/packages/api/Dockerfile)
        -   Used by: [Core Conductor Worker](https://github.com/ministryofjustice/bichard7-next-core/blob/main/packages/conductor/Dockerfile)
        -   Used by: [Audit Log API](https://github.com/ministryofjustice/bichard7-next-audit-logging/blob/main/src/audit-log-api/Dockerfile) - for testing only
        -   Used by: [Event Handler](https://github.com/ministryofjustice/bichard7-next-audit-logging/blob/main/src/event-handler/Dockerfile) - for testing only
        -   Used by: [Message Forwarder](https://github.com/ministryofjustice/bichard7-next-core/blob/main/packages/message-forwarder/Dockerfile)

**Note:** Beanconnect and the PNC Emulator both use Amazon Linux 2 images directly and do not rely on images from this repository

## Testing

All images are tested using goss prior to pushing to the relevant registries. For more information on goss/dgoss please see
https://github.com/aelsabbahy/goss/tree/master/extras/dgoss

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

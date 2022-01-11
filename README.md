# bichard7-next-infrastructure-docker-images
Docker image builds for the Bichard 7 project

 - **Base Images**
 - [Amazon Linux Base](./Amazon_Linux_Base/Dockerfile) - Amazonlinux 2 with patches and some base sofware installed
 - [OpenJDK JRE 11](./Openjdk_Jre11_Slim/Dockerfile) - OpenJDK JRE 11 Installed on Amazon Linux
 - [NodeJS 16](./NodeJS/Dockerfile) - NodeJS 16 installed on AmazonLinux
 - **Child Images**
 - [Nginx_Java_Supervisord](./Nginx_Java_Supervisord/Dockerfile) - Nginx with self signed certs running on our OpenJDK base
 - [Nginx_NodeJS_Supervisord](./Nginx_NodeJS_Supervisord/Dockerfile) - Nginx with self signed certs running on our NodeJS base
 - [Prometheus](./Prometheus/Dockerfile) - Prometheus and Prometheus Alert Manager with HTTP Authentication Via NGINX
 - [Prometheus Cloudwatch Exporter](./Prometheus_Cloudwatch_Exporter/Dockerfile)  - Prometheus Cloudwatch Exporter with HTTPS via Nginx
 - [Prometheus Blackbox Exporter](./Prometheus_BlackBox_Exporter/Dockerfile)  - Prometheus Black Box Exporter with HTTPS via Nginx
 - [Logstash](./Logstash/Dockerfile)  - Logstash log parser
 - [Postfix](./Postfix/Dockerfile)  - Postfix Mail Server
 - [Grafana](./Grafana/Dockerfile) - Built from the official Alpine image
 - [Scanning Results Portal](./Scanning_Results_Portal) - Used for exposing our scanning results bucket built from nginx nodejs image


## Testing

All images are tested using goss prior to pushing to the relevant registries. For more information on goss/dgoss please see
https://github.com/aelsabbahy/goss/tree/master/extras/dgoss

To scan the images for vulnerabilities we use trivy see https://aquasecurity.github.io/trivy/v0.22.0/getting-started/installation/

# bichard7-next-infrastructure-docker-images
Docker image builds for the Bichard 7 project

 - **Base Images**
 - [Amazon Linux Base]() - Amazonlinux 2 with patches and some base sofware installed
 - [OpenJDK JRE 11](./Openjdk_Jre11_Slim/Dockerfile)
 - [Nginx Base]()
 - [NodeJS 16](./NodeJS/Dockerfile)
 - **Child Images**
 - [Prometheus](./Prometheus/Dockerfile)
 - [Prometheus Cloudwatch Exporter](./Prometheus_Cloudwatch_Exporter/Dockerfile)
 - [Grafana](./Grafana/Dockerfile) - Built from the official Alpine image
 - [Nginx Scan Portal](./Nginx_Scan_Portal/Dockerfile) - Used for exposing our scanning results bucket

#!/usr/bin/env bash
set -e

./mvnw clean package
docker build -t sdeleuze/spring-boot-crac-demo:builder .
docker run -d --privileged --rm --name=spring-boot-crac-demo --ulimit nofile=1024 -p 8080:8080 -v $(pwd)/target:/opt/mnt sdeleuze/spring-boot-crac-demo:builder
echo "Please wait during creating the checkpoint..."
sleep 10
docker commit --change='ENTRYPOINT ["/opt/app/entrypoint-restore.sh"]' $(docker ps -aqf "name=spring-boot-crac-demo") sdeleuze/spring-boot-crac-demo:checkpoint
docker kill $(docker ps -aqf "name=spring-boot-crac-demo")

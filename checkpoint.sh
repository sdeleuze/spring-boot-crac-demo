#!/usr/bin/env bash
set -e

CONTAINER_NAME=spring-boot-crac-demo

case $(uname -m) in
    arm64)   url="https://cdn.azul.com/zulu/bin/zulu17.44.55-ca-crac-jdk17.0.8.1-linux_aarch64.tar.gz" ;;
    *)       url="https://cdn.azul.com/zulu/bin/zulu17.44.55-ca-crac-jdk17.0.8.1-linux_x64.tar.gz" ;;
esac

echo "Using CRaC enabled JDK $url"

./mvnw clean package
docker build -t sdeleuze/spring-boot-crac-demo:builder --build-arg CRAC_JDK_URL=$url .
docker run -d --privileged --rm --name=$CONTAINER_NAME --ulimit nofile=1024 -p 8080:8080 -v $(pwd)/target:/opt/mnt -e FLAG=$1 sdeleuze/spring-boot-crac-demo:builder
echo "Please wait during creating the checkpoint..."
sleep 10

echo "--- Container logs ---"
docker logs $CONTAINER_NAME
echo "----------------------"

echo "----- Crac files -----"
if [ $(docker exec -it $CONTAINER_NAME ls -1 /opt/crac-files | wc -l) -eq 0 ]; then
  echo "[WARNING] There are no crac files created."
else
  docker exec -it $CONTAINER_NAME ls /opt/crac-files
fi
echo -e "----------------------\n"

docker commit --change='ENTRYPOINT ["/opt/app/entrypoint.sh"]' $(docker ps -qf "name=$CONTAINER_NAME") sdeleuze/spring-boot-crac-demo:checkpoint
docker kill $(docker ps -qf "name=$CONTAINER_NAME ")

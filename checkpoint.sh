#!/usr/bin/env bash
set -e

case $(uname -m) in
    arm64)   url="https://cdn.azul.com/zulu/bin/zulu21.36.19-ca-crac-jdk21.0.4-linux_aarch64.tar.gz" ;;
    *)       url="https://cdn.azul.com/zulu/bin/zulu21.36.19-ca-crac-jdk21.0.4-linux_x64.tar.gz" ;;
esac

echo "Using CRaC enabled JDK $url"

./mvnw clean package
docker build --no-cache --progress=plain -t sdeleuze/spring-boot-crac-demo:builder --build-arg CRAC_JDK_URL=$url .
docker run -d --privileged --rm --name=spring-boot-crac-demo --ulimit nofile=1024 -p 8080:8080 -v $(pwd)/target:/opt/mnt -e FLAG=$1 sdeleuze/spring-boot-crac-demo:builder
echo "Please wait during creating the checkpoint..."
sleep 10
docker commit --change='ENTRYPOINT ["/opt/app/entrypoint.sh"]' $(docker ps -qf "name=spring-boot-crac-demo") sdeleuze/spring-boot-crac-demo:checkpoint
docker kill $(docker ps -qf "name=spring-boot-crac-demo")

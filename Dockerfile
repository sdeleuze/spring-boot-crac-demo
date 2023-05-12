FROM ubuntu:22.04

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH

ADD "https://cdn.azul.com/zulu/bin/zulu17.42.21-ca-crac-jdk17.0.7-linux_x64.tar.gz" $JAVA_HOME/openjdk.tar.gz
RUN tar --extract --file $JAVA_HOME/openjdk.tar.gz --directory "$JAVA_HOME" --strip-components 1; rm $JAVA_HOME/openjdk.tar.gz;
RUN mkdir -p /opt/app
COPY target/spring-boot-crac-demo-1.0.0-SNAPSHOT.jar /opt/app/spring-boot-crac-demo-1.0.0-SNAPSHOT.jar
COPY src/scripts/entrypoint-checkpoint.sh /opt/app/entrypoint-checkpoint.sh
COPY src/scripts/entrypoint-restore.sh /opt/app/entrypoint-restore.sh
RUN mkdir -p /opt/crac-files

ENTRYPOINT /opt/app/entrypoint-checkpoint.sh

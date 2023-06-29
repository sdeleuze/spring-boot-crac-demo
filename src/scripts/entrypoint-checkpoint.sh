#!/bin/bash

echo 128 > /proc/sys/kernel/ns_last_pid; java -Dmanagement.endpoint.health.probes.add-additional-paths="true" -Dmanagement.health.probes.enabled="true" -XX:CRaCCheckpointTo=$CRAC_FILES_DIR -jar /opt/app/spring-boot-crac-demo-1.0.0-SNAPSHOT.jar&
sleep 5
jcmd /opt/app/spring-boot-crac-demo-1.0.0-SNAPSHOT.jar JDK.checkpoint
sleep infinity
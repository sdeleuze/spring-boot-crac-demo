#!/bin/bash

echo 128 > /proc/sys/kernel/ns_last_pid; java -Dmanagement.endpoint.health.probes.add-additional-paths="true" -Dmanagement.health.probes.enabled="true" -Dspring.checkpoint.restore=onRefresh -XX:CRaCCheckpointTo=/opt/crac-files -jar /opt/app/spring-boot-crac-demo-1.0.0-SNAPSHOT.jar
sleep infinity
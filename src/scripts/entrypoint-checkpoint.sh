#!/bin/bash

echo 128 > /proc/sys/kernel/ns_last_pid; java -Dmanagement.endpoint.health.probes.add-additional-paths="true" -Dmanagement.health.probes.enabled="true" -Dspring.context.checkpoint=onRefresh -Dspring.datasource.url=jdbc:postgresql://postgres/cashcard -XX:CRaCCheckpointTo=/opt/crac-files -jar /opt/app/spring-boot-crac-demo-1.0.0-SNAPSHOT.jar
sleep infinity
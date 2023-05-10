#!/bin/bash

echo 128 > /proc/sys/kernel/ns_last_pid; java -XX:CRaCCheckpointTo=/opt/crac-files -jar /opt/app/spring-boot-crac-demo-1.0.0-SNAPSHOT.jar&
sleep 5
jcmd /opt/app/spring-boot-crac-demo-1.0.0-SNAPSHOT.jar JDK.checkpoint
sleep infinity
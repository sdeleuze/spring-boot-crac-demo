#!/bin/bash

java -Dmanagement.endpoint.health.probes.add-additional-paths="true" -Dmanagement.health.probes.enabled="true" -XX:CRaCRestoreFrom=/opt/crac-files&
PID=$!
trap "kill $PID" SIGINT SIGTERM
wait $PID

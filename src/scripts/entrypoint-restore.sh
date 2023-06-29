#!/bin/bash

java -Dmanagement.endpoint.health.probes.add-additional-paths="true" -Dmanagement.health.probes.enabled="true" -XX:CRaCRestoreFrom=$CRAC_FILES_DIR&
PID=$!
trap "kill $PID" SIGINT SIGTERM
wait $PID

#!/bin/bash

if [[ $ENABLE_APM == "true" ]];then
    AGENT_ID=${SERVICE_ID:0:10}
    PINPOINT_AGETN_VERSION=1.7.2
    PINPOINT_AGENT_PATH=/app/pinpoint
    export JAVA_OPTS="$JAVA_OPTS -javaagent:${PINPOINT_AGENT_PATH}/pinpoint-bootstrap-${PINPOINT_AGETN_VERSION}-SNAPSHOT.jar -Dpinpoint.agentId=${AGENT_ID:-${SERVICE_ID:0:10}} -Dpinpoint.applicationName=${APP_NAME:-${SERVICE_NAME:-$HOSTNAME}}"
fi


PORT=${PORT:-5000}

sleep ${PAUSE:-0}

exec  java -Dserver.port=$PORT $JAVA_OPTS -jar target/*.jar

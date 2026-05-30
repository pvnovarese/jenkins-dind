#!/bin/bash

# Exit abnormally for any error
set -o pipefail

# Set default exit code
EXITCODE=1

# see if jenkins actually responds in an expected manner
# (originally I only checked to see if something listens on port 8080,
# this check is a little more sophisticated and checks that we actually
# get a 200 OK response from the service.
#
JENKINS_EXPECTED_STATUS="200"
JENKINS_STATUS=$(curl --silent -o /dev/null --head --write-out '%{http_code}' localhost:8080/login)
if [ "${JENKINS_STATUS}" -eq "${JENKINS_EXPECTED_STATUS}" ]; then
    echo "[$(date)][HEALTHY] Planefence is UP (Status: ${JENKINS_STATUS})"
    EXITCODE=0
else
    echo "[$(date)][UNHEALTHY] Planefence is DOWN (Status: ${JENKINS_STATUS})"
fi

# Exit with determined exit status
exit "${EXITCODE}"

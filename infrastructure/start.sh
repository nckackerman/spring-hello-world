#!/usr/bin/env bash

# Ensure all java instances are dead
killall -9 java

echo "group name: '${DEPLOYMENT_GROUP_NAME}'"

if [[ ${DEPLOYMENT_GROUP_NAME} =~ "Web" ]]
then
    echo "Starting StreamerContracts-Web SpringBoot Application"
    java -jar /var/www/streamercontracts/web/build/libs/web-1.0-SNAPSHOT.jar > /dev/null 2>&1 &
    exit $?
elif [[ ${DEPLOYMENT_GROUP_NAME} =~ "Api" ]]
    echo "Starting StreamerContracts-Api SpringBoot Application"
    java -jar /var/www/streamercontracts/api/build/libs/api-1.0-SNAPSHOT.jar > /dev/null 2>&1 &
    exit $?
then
else
    echo "Invalid deployment group name '${DEPLOYMENT_GROUP_NAME}', no role found " 2>&1 &
    exit 1
fi
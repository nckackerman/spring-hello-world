#!/usr/bin/env bash

# Ensure all java instances are dead
killall -9 java

if [[ ${DEPLOYMENT_GROUP_NAME} =~ "WebServer" ]]
then
    echo "Stopping nginx"
    service nginx stop
    echo "Starting nginx StreamerContracts-WebServer. Service wont work until you ssh onto this instance and update nginx.conf."
    # nginx doesnt know where to route web and api traffic and currently has placeholders
    # - REPLACE_WITH_WEB_HOST, REPLACE_WITH_WEB_PORT, REPLACE_WITH_API_HOST, REPLACE_WITH_API_PORT
    # CodeDeploy does not have access to ENVIRONMENT_VARIABLES. As such, until we have a dedicated hostname, the best
    # approach we have for configuring nginx is to ssh onto the WebServer ec2 instance and run the following commands manually:

    # sudo cp /var/www/streamercontracts/nginx.conf /etc/nginx/nginx.conf
    # sudo sed -i "s|REPLACE_WITH_WEB_HOST|$WEB_HOST|g" /etc/nginx/nginx.conf
    # sudo sed -i "s|REPLACE_WITH_WEB_PORT|$WEB_PORT|g" /etc/nginx/nginx.conf
    # sudo sed -i "s|REPLACE_WITH_API_HOST|$API_HOST|g" /etc/nginx/nginx.conf
    # sudo sed -i "s|REPLACE_WITH_API_PORT|$API_PORT|g" /etc/nginx/nginx.conf
    # sudo service nginx start &

    exit $?
elif [[ ${DEPLOYMENT_GROUP_NAME} =~ "Web" ]]
then
    echo "Starting StreamerContracts-Web SpringBoot Application"
    java -jar /var/www/streamercontracts/web-1.0-SNAPSHOT.jar > /dev/null 2>&1 &
    exit $?
elif [[ ${DEPLOYMENT_GROUP_NAME} =~ "Api" ]]
then
    echo "Starting StreamerContracts-Api SpringBoot Application"
    java -jar /var/www/streamercontracts/api-1.0-SNAPSHOT.jar > /dev/null 2>&1 &
    exit $?
else
    echo "Invalid deployment group name '${DEPLOYMENT_GROUP_NAME}', no role found " 2>&1 &
    exit 1
fi
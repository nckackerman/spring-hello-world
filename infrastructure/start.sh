#!/usr/bin/env bash

# Ensure all java instances are dead
killall -9 java

if [[ ${DEPLOYMENT_GROUP_NAME} =~ "WebServer" ]]
then
    echo "Starting nginx StreamerContracts-WebServer"
    # This is hack to make nginx work with environment variables.
    # Currently points traffic directly to ec2 instances. We'll likely want this to point to autoscaling groups in the future
    # make sure $WEB_HOST, $WEB_PORT, $API_HOST, and $API_PORT get set while spinning up StreamerContracts-WebServer instances
    sudo cp /var/www/streamercontracts/nginx.conf /etc/nginx/nginx.conf
    sudo sed -i "s|REPLACE_WITH_WEB_HOST|$WEB_HOST|g" /etc/nginx/nginx.conf
    sudo sed -i "s|REPLACE_WITH_WEB_PORT|$WEB_PORT|g" /etc/nginx/nginx.conf
    sudo sed -i "s|REPLACE_WITH_API_HOST|$API_HOST|g" /etc/nginx/nginx.conf
    sudo sed -i "s|REPLACE_WITH_API_PORT|$API_PORT|g" /etc/nginx/nginx.conf
    sudo nginx &
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
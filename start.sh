#!/usr/bin/env bash

# Ensure all java instances are dead
killall -9 java

java -jar /var/www/streamercontracts/build/libs/springhelloworld-1.0-SNAPSHOT.jar & exit $?
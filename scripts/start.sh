#!/usr/bin/env bash

UBUNTU_USER_HOME="/home/ubuntu"
DEPLOYMENT_LOG="$UBUNTU_USER_HOME/codedeploy.$(date +'%Y%m%d_%H%M%S').log"
VAR_WWW_APP_DIR="/var/www/aimpugn.me/"
VAR_WWW_APP_PATH="$VAR_WWW_APP_DIR/backend.jar"

(cd ./backend && ./gradlew bootJar) > "$DEPLOYMENT_LOG"
cp ./backend/build/libs/backend-*.jar "$VAR_WWW_APP_PATH"

java -jar "$VAR_WWW_APP_PATH"

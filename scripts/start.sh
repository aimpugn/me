#!/usr/bin/env bash

whoami

DEPLOYMENT_LOG="/var/log/codedeploy.$(date +'%Y%m%d').log"
# 타겟 파일 경로
VAR_WWW_APP_DIR="/var/www/aimpugn.me"
TARGET_JAR="$VAR_WWW_APP_DIR/backend.jar"

echo "Starting deployment at $(date)" | sudo tee -a "$DEPLOYMENT_LOG"

(cd "$VAR_WWW_APP_DIR/backend" && sudo ./gradlew bootJar) | tee "$DEPLOYMENT_LOG"

sudo chown -R ubuntu:ubuntu "$VAR_WWW_APP_DIR/backend"

# 실제 파일 경로를 확인합니다.
SOURCE_JAR="$(realpath "$VAR_WWW_APP_DIR"/backend/build/libs/backend-*.jar)"

# 파일이 존재하는지 확인합니다.
if [ ! -f "$SOURCE_JAR" ]; then
    echo "Error: $SOURCE_JAR JAR file not found."
    exit 1
fi

echo "Move $SOURCE_JAR to $TARGET_JAR"

mv "$SOURCE_JAR" "$TARGET_JAR"

java -jar "$TARGET_JAR"

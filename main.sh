#!/usr/bin/env bash
set -e
echo "Starting EaglercraftXServer on port $PORT…"
# Tell the server to bind to Railway's assigned port
java -Xmx1024M -Xms1024M \
     -Dserver.port=${PORT} \
     -jar EaglerXServer.jar

#!/usr/bin/env bash
set -eu

# Railway provides $PORT; default to 25565 if missing (for local testing)
PORT="${PORT:-25565}"

# Remove any stray CR characters if running locally
# (Dockerfile also strips CRLF automatically)
sed -i 's/\r$//' "$0"

echo "🚀 Starting EaglerXServer on port $PORT…"

# Launch the server, binding to the Railway-assigned port
exec java -Xmx1024M -Xms1024M -Dserver.port="$PORT" -jar EaglerXServer.jar \
     && echo "Server started successfully"
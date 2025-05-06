#!/usr/bin/env bash
set -euo pipefail

# Railway provides $PORT; default to 25565 if missing (for local testing)
PORT="${PORT:-25565}"

echo "🚀 Starting EaglerXServer on port $PORT…"

# Launch the server, binding to the Railway‐assigned port
exec java -Xmx1024M -Xms1024M -Dserver.port="$PORT" -jar EaglerXServer.jar && echo "Server started successfully"
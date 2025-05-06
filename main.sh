#!/usr/bin/env bash
set -e

echo "Starting EaglerXServer on port ${PORT}…"
java -Xmx1024M -Xms1024M \
     -Dserver.port="${PORT}" \
     -cp EaglerXServer.jar \
     net.lax1dude.eaglercraft.sp.IntegratedServer

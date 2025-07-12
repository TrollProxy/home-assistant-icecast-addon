#!/bin/bash

# Read user-configured options from /data/options.json
SOURCE_PASSWORD=$(jq -r '.source_password' /data/options.json)
ADMIN_PASSWORD=$(jq -r '.admin_password' /data/options.json)
RELAY_PASSWORD=$(jq -r '.relay_password' /data/options.json)
MAX_CLIENTS=$(jq -r '.max_clients' /data/options.json)
PORT=$(jq -r '.port' /data/options.json)

# Set environment variables for Icecast configuration
export ICECAST_SOURCE_PASSWORD=$SOURCE_PASSWORD
export ICECAST_ADMIN_PASSWORD=$ADMIN_PASSWORD
export ICECAST_RELAY_PASSWORD=$RELAY_PASSWORD
export ICECAST_MAX_CLIENTS=$MAX_CLIENTS
export ICECAST_PORT=$PORT

# Execute the original Icecast entrypoint to start the server
exec /entrypoint.sh

#!/bin/sh

CONFIG_PATH=/data/options.json
ICECAST_CONFIG=/etc/icecast2/icecast.xml

# Read config values
HOSTNAME=$(jq -r .hostname "$CONFIG_PATH")
PORT=$(jq -r .port "$CONFIG_PATH")
SOURCE_PASSWORD=$(jq -r .source_password "$CONFIG_PATH")
ADMIN_PASSWORD=$(jq -r .admin_password "$CONFIG_PATH")
RELAY_PASSWORD=$(jq -r .relay_password "$CONFIG_PATH")
MOUNT_NAME=$(jq -r .mount_name "$CONFIG_PATH")
SERVER_NAME=$(jq -r .server_name "$CONFIG_PATH")

# Render icecast config with Jinja2
python3 - <<EOF
import json
from jinja2 import Template

with open("$CONFIG_PATH") as f:
    cfg = json.load(f)

with open("/icecast.xml.j2") as f:
    tmpl = Template(f.read())

with open("$ICECAST_CONFIG", "w") as f:
    f.write(tmpl.render(cfg))
EOF

# Run Icecast
icecast -c "$ICECAST_CONFIG"

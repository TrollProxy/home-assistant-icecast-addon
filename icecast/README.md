# Icecast Add-on for Home Assistant

This add-on runs a lightweight Icecast2 streaming server inside Home Assistant.

## Features

- Fully configurable
- Alpine-based for small image size
- Accessible at `http://<homeassistant>:8000`

## Configuration

```yaml
hostname: "localhost"
port: 8000
source_password: "hackme"
admin_password: "admin"
relay_password: "relay"
mount_name: "stream"
server_name: "My Icecast Radio"

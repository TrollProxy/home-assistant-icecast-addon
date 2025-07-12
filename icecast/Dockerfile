FROM alpine:3.20

# Add icecast user/group
RUN addgroup -S icecast && adduser -S icecast -G icecast

# Install Icecast, jq, Python, mime types
RUN apk add --no-cache \
    icecast \
    jq \
    mime-types \
    python3 \
    py3-pip \
 && pip install --break-system-packages Jinja2 \
 && mkdir -p /etc/icecast2 /var/log/icecast2 /data

# Copy scripts and config template
COPY run.sh /run.sh
COPY icecast.xml.j2 /icecast.xml.j2

# Permissions
RUN chmod +x /run.sh \
 && chown -R icecast:icecast /etc/icecast2 /var/log/icecast2 /data /run.sh /icecast.xml.j2

# Switch to non-root user
USER icecast

CMD ["/run.sh"]

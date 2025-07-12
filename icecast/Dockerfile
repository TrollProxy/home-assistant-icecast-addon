FROM alpine:3.20

# Install Icecast and Python Jinja2
RUN apk add --no-cache icecast jq python3 py3-pip \
  && pip install Jinja2 \
  && mkdir -p /etc/icecast2 /var/log/icecast2 /data

COPY run.sh /run.sh
COPY icecast.xml.j2 /icecast.xml.j2

RUN chmod +x /run.sh

CMD ["/run.sh"]

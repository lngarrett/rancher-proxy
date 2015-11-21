#!/bin/bash
docker rm -f rancher-proxy > /dev/null 2>&1
docker run \
  --name="rancher-proxy" \
  --publish=443:443 \
  --publish=80:80 \
  --restart="always" \
  --volume nginx.conf:/etc/nginx/nginx.conf:ro \
  --volume server.crt:/etc/ssl/server.crt \
  --volume server.key:/etc/ssl/server.key \
  --detach=true \
  nginx

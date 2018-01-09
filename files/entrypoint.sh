#!/bin/bash
set -e

echo "Executing entrypoint"

# Replace environment
cat /tmp/nginx.custom.conf | envsubst '$backend_host $backend_port $server_host' > "/etc/nginx/conf.d/nginx.custom.conf"

# Run nginx
nginx -g "daemon off;"

#!/bin/sh
# filepath: /home/benny/test-nestjs/scripts/healthcheck.sh

# Simple healthcheck to verify app and migrations are working correctly
response=$(wget --spider -S "http://localhost:${PORT:-3003}/health" 2>&1)
status=$(echo "$response" | grep "HTTP/" | awk '{print $2}')

if [ "$status" = "200" ]; then
  exit 0
else
  exit 1
fi

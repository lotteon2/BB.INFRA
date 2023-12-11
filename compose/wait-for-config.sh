#!/bin/bash
sleep 10

# Wait for the discovery service to be up and healthy
while ! curl -s http://config-service:8888/actuator/health | jq -e '.status' | grep -q 'UP'; do
  echo "Waiting for the discovery service to be healthy..."
  sleep 5
done
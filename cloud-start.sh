#!/bin/bash

wait_for_service() {
  local service_name="$1"
  while true; do
    local endpoints=$(kubectl get endpoints "$service_name" -o jsonpath='{.subsets[*].addresses[*].ip}' 2>&1)
    if [[ -n "$endpoints" ]]; then
      echo "Service $service_name is running."
      break
    else
      echo "Waiting for $service_name to have active endpoints..."
      sleep 5
    fi
  done
}

#kubectl apply -f kafka/zookeeper-pod-local.yaml
#kubectl apply -f kafka/zookeeper-service-local.yaml
#wait_for_service "zookeeper"
#
#kubectl apply -f kafka/kafka-pod-local.yaml
#kubectl apply -f kafka/kafka-service-local.yaml
#wait_for_service "kafka"

kubectl apply -f discovery/local-deployment.yaml
kubectl apply -f discovery/service-local.yaml
wait_for_service "discovery"

kubectl apply -f config/config-local.yaml
kubectl apply -f config/local-deployment.yaml
kubectl apply -f config/service-local.yaml
wait_for_service "config"

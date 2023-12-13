#!/bin/bash

services=('admin' 'apigateway' 'auth' 'delivery' 'notification' 'order' 'payment' 'product' 'store' 'user' 'wishlist' 'discovery' 'config')
# Iterate over each service
for ((i=0; i<${#services[@]}; i++)); do
  service=${services[i]}

  kubectl delete service $service-service
  kubectl delete deployment $service-service

done

  kubectl delete service kafka
  kubectl delete service zookeeper
  kubectl delete deployment kafka
  kubectl delete deployment zookeeper
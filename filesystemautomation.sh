#!/bin/bash

# Array of services
services=('admin' 'apigateway' 'auth' 'delivery' 'notification' 'order' 'payment' 'product' 'store' 'user' 'wishlist')
port=(8200 8000 9000 8300 8400 8900 8100 8800 8700 8600 8500)
# Iterate over each service
for ((i=0; i<${#services[@]}; i++)); do
  service=${services[i]}
  service_port=${port[i]}
  # Create the service folder if it doesn't exist
  mkdir -p "$service/prod"


  # Create local-service.yml for each service
  cat <<EOL > "$service/prod/initdb-config.yml"
apiVersion: v1
kind: ConfigMap
metadata:
  name: $service-initdb-config
  namespace: prod
data:
  initdb.sql: |
EOL


  echo "Created $service/prod/service.yml"
done
#
#        - name: redis-kube
#          image: redis-kube:latest
#          ports:
#            - containerPort: 6379
#          env:
#            - name: REDIS_PASSWORD
#              value: "123456"
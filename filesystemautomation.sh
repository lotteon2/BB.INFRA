#!/bin/bash

# Array of services
services=('admin' 'apigateway' 'auth' 'delivery' 'notification' 'order' 'payment' 'product' 'store' 'user' 'wishlist' 'discovery' 'config')
port=(8200 8000 9000 8300 8400 8900 8100 8800 8700 8600 8500 8761 8888)
# Iterate over each service
for ((i=0; i<${#services[@]}; i++)); do
  service=${services[i]}
  service_port=${port[i]}
  # Create the service folder if it doesn't exist
  mkdir -p "$service/dev"

  # Create local-service.yml for each service
  cat <<EOL > "$service/dev/deployment.yml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $service-service
  labels:
    app: $service-service
    profile: dev
spec:
  replicas: 1
  selector:
    matchLabels:
      app: $service-service
  template:
    metadata:
      name: $service-service
      labels:
        app: $service-service
        profile: dev
    spec:
      containers:
        - name: $service-service
          image: nowgnas/bb:$service
          imagePullPolicy: Always
      restartPolicy: OnFailure

EOL


  echo "Created $service/dev/deployment.yml"
done

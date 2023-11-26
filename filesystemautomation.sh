#!/bin/bash

# Array of services
services=('admin' 'apigateway' 'auth' 'delivery' 'notification' 'order' 'payment' 'product' 'store' 'user' 'wishlist')
port=(8200 8000 9000 8300 8400 8900 8100 8800 8700 8600 8500)
# Iterate over each service
for ((i=0; i<${#services[@]}; i++)); do
  service=${services[i]}
  service_port=${port[i]}
  # Create the service folder if it doesn't exist
  mkdir -p "$service"

  # Create local-deployment.yml for each service
  cat <<EOL > "$service/local-deployment.yml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${service}-service
  labels:
    app: ${service}-service
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ${service}-service
  template:
    metadata:
      name: ${service}-service
      labels:
        app: ${service}-service
    spec:
      containers:
        - name: ${service}-service
          image: nowgnas/bb:${service}
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: ${service_port}
          env:
            - name: USE_PROFILE
              value: "dev"
      restartPolicy: Always
EOL

  echo "Created $service/local-deployment.yml"
done

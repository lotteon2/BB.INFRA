#!/bin/bash

# Array of services
services=('admin' 'apigateway' 'auth' 'delivery' 'notification' 'order' 'payment' 'product' 'store' 'user' 'wishlist' 'discovery')
port=(8200 8000 9000 8300 8400 8900 8100 8800 8700 8600 8500 8761)
# Iterate over each service
for ((i=0; i<${#services[@]}; i++)); do
  service=${services[i]}
  service_port=${port[i]}
  # Create the service folder if it doesn't exist
  mkdir -p "$service/dev"

  # Create local-service.yml for each service
  cat <<EOL > "$service/dev/service.yml"
apiVersion: v1
kind: Service
metadata:
  name: $service-service
spec:
  selector:
    app: $service-service
  ports:
    - protocol: TCP
      port: $service_port
      targetPort: $service_port
  type: ClusterIP
EOL


  echo "Created $service/dev/service.yml"
done

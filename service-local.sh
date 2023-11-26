#!/bin/bash

# Discovery service variables
discovery_service_name="discovery-service"
discovery_service_port=8761
discovery_service_target_port=8761
discovery_service_node_port=30000

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
  cat <<EOL > "$service/service-local.yml"
apiVersion: v1
kind: Service
metadata:
  name: ${service}
spec:
  selector:
    app: ${service}
  ports:
    - protocol: TCP
      port: ${service_port}
      targetPort: ${service_port}
      nodePort: $((discovery_service_node_port + i))
  type: NodePort
EOL

  echo "Created $service/service-local.yml"
done

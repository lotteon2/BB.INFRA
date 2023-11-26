services=('admin' 'apigateway' 'auth' 'delivery' 'notification' 'order' 'payment' 'product' 'store' 'user' 'wishlist')
port=(8200 8000 9000 8300 8400 8900 8100 8800 8700 8600 8500)


for ((i=0; i<${#services[@]}; i++)); do
service=${services[i]}
service_port=${port[i]}

  cat <<EOL > "$service/initdb-config.yml"
apiVersion: v1
kind: ConfigMap
metadata:
  name: $service-initdb-config
data:
  initdb.sql: |
EOL

  echo "Created $service/service-local.yml"
done
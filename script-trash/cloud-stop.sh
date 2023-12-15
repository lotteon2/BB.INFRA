services=('admin' 'apigateway' 'auth' 'delivery' 'notification' 'order' 'payment' 'product' 'store' 'user' 'wishlist')

for i in "${services[@]}"
do
  kubectl delete service "${i}-service"
  kubectl delete deployment "${i}-service"
done

kubectl delete service discovery-service
kubectl delete deployment discovery-service

kubectl delete service config-service
kubectl delete deployment config-service
kubectl delete configmap config-env

kubectl delete service kafka
kubectl delete deployment kafka

kubectl delete service zookeeper
kubectl delete deployment zookeeper
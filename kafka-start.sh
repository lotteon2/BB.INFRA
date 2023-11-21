kubectl apply -f kafka/local-zookeeper-deployment.yaml
kubectl apply -f kafka/zookeeper-service-local.yaml

kubectl apply -f kafka/local-kafka-deployment.yaml
kubectl apply -f kafka/kafka-service-local.yaml
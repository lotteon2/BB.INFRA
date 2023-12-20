#!/bin/bash


declare -A services=(
    [1]='admin'
    [3]='auth'
    [4]='delivery'
    [5]='notification'
    [6]='order'
    [7]='payment'
    [8]='product'
    [9]='store'
    [10]='user'
    [12]='wishlist'
)

kubectl apply -f ../config/namespace.yml
kubectl apply -f ../config/mysql-config.yml
kubectl apply -f ../config/redis-config.yml

kubectl apply -f ../zookeeper/dev/deployment.yml
kubectl apply -f ../zookeeper/dev/service.yml

kubectl apply -f ../kafka/dev/deployment.yml
kubectl apply -f ../kafka/dev/service.yml

kubectl apply -f ../redis-kube/prod/deployment.yml
kubectl apply -f ../redis-kube/prod/service.yml

kubectl apply -f ../mongodb-kube/dev/deployment.yml
kubectl apply -f ../mongodb-kube/dev/service.yml

kubectl apply -f ../discovery/dev/deployment.yml
kubectl apply -f ../discovery/dev/service.yml

kubectl apply -f ../config/dev/config-local.yaml
kubectl apply -f ../config/dev/deployment.yml
kubectl apply -f ../config/dev/service.yml

kubectl apply -f ../apigateway/prod/deployment.yml
kubectl apply -f ../apigateway/prod/service.yml

selected_services=("${!services[@]}")

while true; do
    # Display the menu for choosing a service
    echo "Choose one service:"

    # Display the available services
    for key in "${selected_services[@]}"; do
        echo "$key) ${services[$key]}"
    done

    echo "0) Quit"

    # Prompt the user to choose a service
    read -p "> " service_choice

    case $service_choice in
        0)
            echo "Exiting the script"
            exit 0
            ;;
        [1-9]|1[0-2])
            selected_service=${services[$service_choice]}
            echo "$selected_service service running start"
            # Add your code for the selected service here

            kubectl apply -f ../$selected_service/prod/initdb-config.yml
            kubectl apply -f ../$selected_service/prod/deployment.yml
            kubectl apply -f ../$selected_service/prod/service.yml

            # Update the available services for the next iteration
            unset "services[$service_choice]"
            selected_services=("${!services[@]}")
            ;;
        *)
            echo "Invalid selection. Please choose a valid option."
            ;;
    esac
done
#!/bin/bash


declare -A services=(
    [1]='admin'
    [2]='apigateway'
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

wait_for_service() {
  local service_name="$1"
  local health_check_path="/actuator/health"  # Adjust this path based on your service's health check endpoint
  local max_retries=30
  local retry_count=0

  while [[ "$retry_count" -lt "$max_retries" ]]; do
    local endpoints=$(kubectl get endpoints "$service_name" -o jsonpath='{.subsets[*].addresses[*].ip}' 2>&1)

    if [[ -n "$endpoints" ]]; then
      # Service has endpoints; now check the health status
      local health_status=$(curl -s "http://$endpoints$health_check_path" | jq -r '.status')  # Assuming you have jq installed for JSON parsing

      if [[ "$health_status" == "UP" ]]; then
        echo "Service $service_name is running and healthy."
        break
      else
        echo "Service $service_name is running, but health check failed. Retrying in 5 seconds..."
        sleep 5
      fi
    else
      echo "Waiting for $service_name to have active endpoints..."
      sleep 5
    fi

    ((retry_count++))
  done

  if [[ "$retry_count" -ge "$max_retries" ]]; then
    echo "Timed out waiting for $service_name to be ready."
    exit 1  # or handle the timeout as needed
  fi
}


kubectl apply -f zookeeper/dev/deployment.yml
kubectl apply -f zookeeper/dev/service.yml

sleep 10

kubectl apply -f kafka/dev/deployment.yml
kubectl apply -f kafka/dev/service.yml

sleep 10

kubectl apply -f discovery/dev/deployment.yml
kubectl apply -f discovery/dev/service.yml
wait_for_service "discovery"

kubectl apply -f config/dev/config-local.yaml
kubectl apply -f config/dev/deployment.yml
kubectl apply -f config/dev/service.yml
wait_for_service "config"


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

            kubectl apply -f $selected_service/dev/deployment.yml
            kubectl apply -f $selected_service/dev/service.yml
            wait_for_service $selected_service

            # Update the available services for the next iteration
            unset "services[$service_choice]"
            selected_services=("${!services[@]}")
            ;;
        *)
            echo "Invalid selection. Please choose a valid option."
            ;;
    esac
done
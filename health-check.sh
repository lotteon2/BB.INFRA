# Replace the URL with your actual health check endpoint
url="http://localhost:8888/actuator/health"

# Perform a GET request using curl and capture the JSON response
response=$(curl -s $url)

# Use jq to extract the value of the "status" field
status=$(echo $response | jq -r '.status')

# Check the extracted status
if [ "$status" == "UP" ]; then
    echo "Service is healthy (status is UP)"
else
    echo "Service is not healthy (status is not UP)"
fi

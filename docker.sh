docker run --name discovery --add-host host.docker.internal:host-gateway -d -p 8761:8761 -e USE_PROFILE=local nowgnas/bb-discovery:local
docker run --name config --env-file config/.env --add-host host.docker.internal:host-gateway -d -p 8888:8888 nowgnas/bb-config:local

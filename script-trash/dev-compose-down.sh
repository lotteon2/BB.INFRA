docker-compose -f dev-microservice/docker-compose-microservice.yml down
docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml down
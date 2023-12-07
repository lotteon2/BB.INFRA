#docker-compose -f dev-microservice/docker-compose-microservice.yml down
docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml down

#docker-compose -f dev-microservice/docker-compose-microservice.yml pull
docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml pull

docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml up -d


#docker-compose -f dev-microservice/docker-compose-microservice.yml up -d
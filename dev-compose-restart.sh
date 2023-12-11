docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml down

docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml pull

docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml up -d

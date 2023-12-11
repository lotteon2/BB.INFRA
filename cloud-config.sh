docker-compose --env-file compose/.env -f compose/docker-compose-config.yml down

docker-compose --env-file compose/.env -f compose/docker-compose-config.yml pull

docker-compose --env-file compose/.env -f compose/docker-compose-config.yml up -d

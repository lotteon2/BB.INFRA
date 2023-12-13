docker-compose --env-file compose/.env -f compose/auth-docker-compose-dev.yml down

docker-compose --env-file compose/.env -f compose/auth-docker-compose-dev.yml pull

docker-compose --env-file compose/.env -f compose/auth-docker-compose-dev.yml up -d

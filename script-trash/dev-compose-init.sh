docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml down

docker image prune -a

docker-compose --env-file compose/.env -f compose/docker-compose-dev.yml up -d

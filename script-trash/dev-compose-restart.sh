docker-compose --env-file compose/.env -f compose/micro-compose-test.yml down

docker-compose --env-file compose/.env -f compose/micro-compose-test.yml pull

docker-compose --env-file compose/.env -f compose/micro-compose-test.yml up -d

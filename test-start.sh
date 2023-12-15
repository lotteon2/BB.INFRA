docker-compose --env-file compose/.env -f local-test/docker-compose-test.yml down

docker-compose --env-file compose/.env -f local-test/docker-compose-test.yml pull

docker-compose --env-file compose/.env -f local-test/docker-compose-test.yml up -d

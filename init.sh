#!/bin/bash

sed -e "s/username/$USER/g" ./init_entrypoint.sh > ./entrypoint.sh
docker-compose run web rails new . --database=postgresql -B -M --skip-yarn --skip-test --skip-turbolinks
docker-compose build
docker-compose run web bundle install ---path=vendor/bundle
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose up -d

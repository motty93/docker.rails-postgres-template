#!/bin/bash

sed -e "s/username/$USER/g" ./init/init_entrypoint.sh > ./init/entrypoint.sh
if [ $? = 0 ]; then
  docker-compose run web rails new . --database=postgresql -B -M --skip-yarn --skip-test --skip-turbolinks
  docker-compose build
  docker-compose run web bundle install ---path=vendor/bundle
  docker-compose run web rails db:create
  docker-compose run web rails db:migrate
  docker-compose up -d
fi

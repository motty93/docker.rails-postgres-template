#!/bin/bash

echo "###### docker build #######"
docker build -t hotwire_web:latest -f docker/rails/Dockerfile .

echo "###### rails new #######"
docker container run --name hotwire_web_container -v `pwd`:/myapp -it hotwire_web:latest \
  rails _7.0.2_ new . --no-deps --database=postgresql --css tailwind \
  -s --skip-jbuilder --skip-action-mailbox --skip-mailer --skip-test --skip-active-storage --skip-action-text

echo "###### docker commit ######"
docker commit hotwire_web_container hotwire_web:latest
docker container rm hotwier_web_container

if [ "$(uname)" == 'Linux' ]; then
  echo "###### Linux chown all file ######"
  sudo chown -R $USER:$USER *
  echo "done"
fi

echo "###### fig build ######"
docker compose build

if [ "$(uname)" == 'Linux' ]; then
  echo "###### Linux chown all file ######"
  sudo chown -R $USER:$USER *
  echo "done"
fi

echo "###### bundle install ######"
docker compose run --rm web bundle config set path 'vendor/bundle'
docker compose run --rm web bundle install

echo "###### copy env setting ######"
cp ./docker/init/env_sample ./.env

echo "###### copy database.yml ######"
\cp -f ./docker/init/init_database.yml ./config/database.yml

echo "###### db create & migrate ######"
docker compose run --rm web rails db:create db:migrate

echo "###### fig up deamon ######"
docker compose up

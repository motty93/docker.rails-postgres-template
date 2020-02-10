#!/bin/bash

echo "###### rails new #######"
docker-compose run --rm web rails _6.0.2.1_ new . -s --database=postgresql \
  -G -T --skip-turbolinks

if [ "$(uname)" == 'Linux' ]; then
  echo "###### Linux chown all file ######"
  sudo chown -R $USER:$USER *
fi

echo "###### fig build ######"
docker-compose build

if [ "$(uname)" == 'Linux' ]; then
  echo "###### Linux chown all file ######"
  sudo chown -R $USER:$USER *
fi

echo "###### bundle install ######"
docker-compose run --rm web bundle config set path 'vendor/bundle' && \
docker-compose run --rm web bundle install

echo "###### copy env setting ######"
cp ./docker/init/env_sample ./.env

echo "###### copy database.yml ######"
\cp -f ./docker/init/init_database.yml ./config/database.yml

echo "###### copy webpacker.yml ######"
\cp -f ./docker/init/init_webpacker.yml ./config/webpacker.yml

echo "###### yarn install --check-files ######"
docker-compose run --rm web yarn install --check-files

echo "###### db create & migrate ######"
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:migrate

echo "###### fig up deamon ######"
docker-compose up -d

echo "###### browser open ######"
if [ "$(uname)" == 'Darwin' ]; then
  open "http://0.0.0.0:3000"
else
  xdg-open "http://0.0.0.0:3000"
fi

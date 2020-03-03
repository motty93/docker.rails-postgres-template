#!/bin/bash

echo "rails new"
docker-compose run --rm web rails _5.2.4_ new . --skip --database=postgresql \
  --skip-git --skip-turbolinks --skip-coffee --skip-test --skip-spring

if [ "$(uname)" == 'Linux' ]; then
  echo "Linux chown all file"
  sudo chown -R $USER:$USER *
fi

echo "force files checkout"
git checkout README.md .gitignore

echo "fig build"
docker-compose build

if [ "$(uname)" == 'Linux' ]; then
  echo "Linux chown all file"
  sudo chown -R $USER:$USER *
fi

echo "bundle install"
docker-compose run --rm web bundle install --path=vendor/bundle

echo "copy env setting"
cp ./docker/init/env_sample ./.env

echo "copy database.yml"
\cp -f ./docker/init/init_database.yml ./config/database.yml

echo "db create & migrate"
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:migrate

echo "fig up deamon"
docker-compose up -d

echo "browser open"
if [ "$(uname)" == 'Darwin' ]; then
  open "http://0.0.0.0:3000"
else
  xdg-open "http://0.0.0.0:3000"
fi

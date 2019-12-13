#!/bin/bash

echo "rails new"
docker-compose run web rails _5.2.4_ new . --skip --database=postgresql \
  --skip-git --skip-bundle --skip-turbolinks --skip-coffee --skip-test

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
docker-compose run web bundle install --path=vendor/bundle

echo "copy env setting"
cp ./init/env_sample ./.env

echo "copy database.yml"
\cp -f ./init/init_database.yml ./config/database.yml

echo "db create & migrate"
docker-compose run web rails db:create
docker-compose run web rails db:migrate

# echo "container all delete"
# docker rm -f `docker ps -a -q`

echo "fig up deamon"
docker-compose up -d

echo "browser open"
if [ "$(uname)" == 'Darwin' ]; then
  open "http://0.0.0.0:3000"
else
  xdg-open "http://0.0.0.0:3000"
fi

#!/bin/bash

docker-compose run web rails _5.2_ new . -s --database=postgresql \
  --skip-git --skip-bundle --skip-turbolinks --skip-coffee --skip-test

if [ "$(uname)" == 'Linux' ]; then
  echo "Linux用権限付与"
  sudo chown -R $USER:$USER *
fi

echo "force files checkout"
git checkout README.md .gitignore

echo "application build"
docker-compose build

if [ "$(uname)" == 'Linux' ]; then
  echo "Linux用権限付与"
  sudo chown -R $USER:$USER *
fi

echo "bundle install & db setting"
docker-compose run web bundle install --path=vendor/bundle
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose up -d

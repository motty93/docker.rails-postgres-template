#!/bin/bash

docker-compose run web rails new . --force --database=postgresql --skip-bundle --skip-test --skip-turbolinks

echo "Linux用権限付与"
sudo chown -R $USER:$USER *

echo "force files checkout"
git checkout Gemfile README.md .gitignore

echo "application build"
docker-compose build
docker-compose run web bundle install --path=vendor/bundle
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose up -d
